// deeply nested struct chain
struct Layer1 { field: Int; }
struct Layer2 { inner: Layer1; }
struct Layer3 { inner: Layer2; }
struct Layer4 { inner: Layer3; }
struct Layer5 { inner: Layer4; }

contract TestContract {
    val: Layer5;

    init() {
        self.val = Layer5{
            inner: Layer4{
                inner: Layer3{
                    inner: Layer2{
                        inner: Layer1{ field: 42 }
                    }
                }
            }
        };
    }
}