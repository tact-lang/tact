// Struct with deeply nested optional chain, testing optional collapsing
struct S4 { x: Int; } 
struct S3 { s4: S4?; } 
struct S2 { s3: S3?; } 
struct S1 { s2: S2?; } 

contract CollapseOptional {
  s: S1?;

  init() {
    self.s = null;
  }
}