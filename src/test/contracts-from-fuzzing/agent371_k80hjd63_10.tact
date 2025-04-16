struct Layer1 { val: Int; }
struct Layer2 { inner: Layer1; }
struct Layer3 { inner: Layer2; }
contract TestContract {
    x: Layer3;
    init() {
        self.x = Layer3{
            inner: Layer2{
                inner: Layer1{ val: 42 }
            }
        };
    }
}
