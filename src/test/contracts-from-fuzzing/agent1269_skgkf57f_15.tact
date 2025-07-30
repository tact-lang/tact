struct Inner {
 x: Int;
 y: Int;
}

struct Middle {
 inr: Inner;
 y: Int;
}

struct Outer {
 mid: Middle;
 z: Int;
}

contract MultiLayer {
 store: Outer;
 init() {
  self.store = Outer{
   mid: Middle{
    inr: Inner{ x: 5, y: 6 },
    y: 10,
   },
   z: 20,
  };
 }
}