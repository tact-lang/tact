struct S { x: Int; y: Int; z: Int; }

contract ManySimple {
  a: S;
  b: S;
  c: S;
  d: S;
  e: S;
  f: S;
  g: S;
  h: S;
  i: S;
  j: S;

  init() {
    self.a = S{ x:1, y:2, z:3 };
    self.b = S{ x:4, y:5, z:6 };
    self.c = S{ x:7, y:8, z:9 };
    self.d = S{ x:10,y:11,z:12 };
    self.e = S{ x:13,y:14,z:15 };
    self.f = S{ x:16,y:17,z:18 };
    self.g = S{ x:19,y:20,z:21 };
    self.h = S{ x:22,y:23,z:24 };
    self.i = S{ x:25,y:26,z:27 };
    self.j = S{ x:28,y:29,z:30 };
  }
}