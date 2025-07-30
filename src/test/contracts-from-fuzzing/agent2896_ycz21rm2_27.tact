struct MiddleLayer {
 x: Int;
 y: Int?;
}

struct OuterLayer {
 a: MiddleLayer?;
 b: Int;
}

contract NestedOptionalLayer {
 val: OuterLayer;

 init() {
  self.val = OuterLayer{
    a: MiddleLayer{ x:2,y:null },
    b: 5,
  };
 }
}