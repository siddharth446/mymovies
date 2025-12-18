# My Movies App (Supabase Version)

A premium Flutter mobile application for browsing and watching movie trailers, powered by Supabase.

## Features
- **Dynamic Content**: Movie list synced in real-time with Supabase Postgres.
- **Premium Video Playback**: Integrated Chewie/Video Player with full controls and fullscreen support.
- **Image Caching**: Smooth scrolling experience with `cached_network_image`.
- **Search**: Built-in search functionality to find movies by title.
- **Sleek UI**: Dark theme designed for a cinematic experience.

## Setup Instructions

### 1. Supabase Project Configuration
1. Create a new project on [Supabase.com](https://supabase.com).
2. Go to **Project Settings > API** to get your `Project URL` and `anon key`.
3. Open `lib/main.dart` and replace `YOUR_SUPABASE_URL` and `YOUR_SUPABASE_ANON_KEY`.

### 2. Database Schema
Run the following SQL in your Supabase SQL Editor:

```sql
create table movies (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  title text not null,
  description text,
  poster_url text,
  video_url text,
  release_year int,
  rating numeric,
  genres text[]
);

-- Enable Realtime for the movies table
alter table movies replica identity full;
begin;
  drop publication if exists supabase_realtime;
  create publication supabase_realtime for table movies;
commit;
```

### 3. Storage Setup
1. Create two public buckets in Supabase Storage: `posters` and `videos`.
2. Upload your movie posters and video trailers and get their public URLs to store in the `movies` table.

### 4. Run the App
```bash
flutter pub get
flutter run
```

## Dependencies
- `supabase_flutter`: Backend as a Service.
- `cached_network_image`: Optimized poster loading.
- `video_player` & `chewie`: High-quality video playback.
- `shimmer`: Sleek loading animations.
- `provider`: Clean state management.
