struct Sub { x: Int; }

struct Mid {
 y: Sub;
}

struct Top {
 z: Mid;
}

contract MultiLayer {
 data: Top;
 init() {
   self.data = Top{ z: Mid{ y: Sub{ x: 12 } } };
 }
}