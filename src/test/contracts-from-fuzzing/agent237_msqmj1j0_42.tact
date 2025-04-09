struct Layer1 {
    one: Int;
    two: Bool?;
}

struct Layer2 {
    inner: Layer1?;
}

struct Layer3 {
    wrap: Layer2;
}

contract Multilayered {
    ref: Layer3;
    init() {
        self.ref = Layer3{wrap: Layer2{inner: null}};
    }
}