struct InnerMost {
 x: Int;
 y: Bool;
}

struct MiddleLevel {
 inner: InnerMost;
 s: String;
}

struct OuterMost {
 mid: MiddleLevel;
 flag: Bool;
}

contract TestNest {
 nested: OuterMost;
 init() {
   self.nested = OuterMost {
     mid: MiddleLevel {
       inner: InnerMost { x: 1, y: true },
       s: "hi"
     },
     flag: false
   };
 }
}
