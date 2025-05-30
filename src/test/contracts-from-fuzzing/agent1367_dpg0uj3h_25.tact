struct Layer4 { x: Int?; }
struct Layer3 { l4: Layer4; }
struct Layer2 { l3: Layer3; }
struct Layer1 { l2: Layer2; }

contract LayeredDeep {
  data: Layer1;

  init() {
    self.data = Layer1{
      l2: Layer2{
        l3: Layer3{
          l4: Layer4{
            x: null,
          },
        },
      },
    };
  }
}