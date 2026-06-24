struct Layer3 { deep: Int }

struct Layer2 { nested: Layer3 }

struct Layer1 { deeper: Layer2 }

contract ExtremeDepth {
    val: Layer1;

    init() {
        self.val = Layer1{
            deeper: Layer2{
                nested: Layer3{
                    deep: 777
                }
            }
        };
    }
}