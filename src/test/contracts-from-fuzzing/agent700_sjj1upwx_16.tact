contract ManyFields {
  a: Int = 1; 
  b: Bool = true;
  c: String = "x";
  d: Int = 2; 
  e: Bool = false;
  f: String = "y";
  g: Int = 3; 
  h: Bool = true;
  i: String = "z";
  j: Int? = null;
  k: Bool? = null;
  l: String? = null;

  init() {
    self.j = null; self.k = null; self.l = null;
  }
}