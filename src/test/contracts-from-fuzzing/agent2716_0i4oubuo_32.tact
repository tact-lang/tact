// Large nested struct test
struct Layer1 { x: Int; }
struct Layer2 { l1: Layer1; y: Int; }
struct Layer3 { l2: Layer2; z: Int; }
struct Layer4 { l3: Layer3; t: Int; }
struct Layer5 { l4: Layer4; u: Int; }
struct Layer6 { l5: Layer5; v: Int; }

contract LotsNested {
  data: Layer6;
  init() {
    self.data = Layer6{
      l5: Layer5{
        l4: Layer4{
          l3: Layer3{
            l2: Layer2{
              l1: Layer1{x:1}, y:2
            }, z:3
          }, t:4
        }, u:5
      }, v:6
    };
  }
}