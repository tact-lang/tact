struct Layer3 { x: Int }
struct Layer2 { inner3: Layer3 }
struct Layer1 { inner2: Layer2 }

contract NestedWrap {
    val: Layer1;

    init() {
        self.val = Layer1{
            inner2: Layer2{
                inner3: Layer3{ x: 777 }
            }
        };
    }
}