struct Deeply {
 x: Int;
 y: Bool;
}

struct Middle {
 d: Deeply;
 s: String;
}

struct Upper {
 m: Middle;
 b: Bool;
}

contract Top {
 data: Upper;

 init() {
  self.data = Upper{
   m: Middle{
    d: Deeply{ x: 9, y: false },
    s: "middle"
   },
   b: true
  };
 }
}