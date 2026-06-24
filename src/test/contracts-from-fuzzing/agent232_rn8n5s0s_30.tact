struct Layer1 {
    foo: Int;
}
struct Layer2 {
    inner: Layer1;
}
struct Layer3 {
    inner: Layer2;
}

contract Layered {
    nested: Layer3;

    init() {
        self.nested = Layer3{
            inner: Layer2{
                inner: Layer1{
                    foo: 999
                }
            }
        };
    }
}