/*
 * Copyright © 1991-2006 Bart Massey
 * ALL RIGHTS RESERVED
 * [This program is licensed under the "3-clause ('new') BSD License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */


// -*- C++ -*-

// a simple fast texture class -- interface
// Bart 2/91

class point;
class model;
class texture;

class fast_texture : public texture {
protected:
  point pl;	// light-point
  point pli;    // light intensity
  point pe;	// eye-point
public:
  fast_texture( model &, texture & );
  fast_texture( const fast_texture & );
  virtual texture * tune_texture( model & );
  virtual point value( point &, point &, point &, model &, int );
};
