struct Layer3 {
    x: Int;
    y: Bool;
}

struct Layer2 {
    f: Layer3;
}

struct Layer1 {
    f: Layer2;
}

contract NestedMany {
    state: Layer1;

    init() {
        self.state = Layer1{
            f: Layer2 {
                f: Layer3 {
                    x: 99,
                    y: false,
                }
            }
        };
    }
}
