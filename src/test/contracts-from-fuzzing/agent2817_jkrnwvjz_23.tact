struct NestedL1 { l2: NestedL2; }
struct NestedL2 { l3: NestedL3; }
struct NestedL3 { l4: NestedL4; }
struct NestedL4 { l5: NestedL5; }
struct NestedL5 { l6: NestedL6; }
struct NestedL6 { leaf: Int; }

contract DeepNesting {
  root: NestedL1;

  init() {
    self.root = NestedL1{
      l2: NestedL2{
        l3: NestedL3{
          l4: NestedL4{
            l5: NestedL5{
              l6: NestedL6{ leaf:123 }
            }
          }
        }
      }
    };
  }
}
