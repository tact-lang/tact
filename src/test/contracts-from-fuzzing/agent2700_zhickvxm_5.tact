struct Layer3 {
    z: Bool;
}

struct Layer2 {
    inner: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

contract MultiNested {
    data: Layer1;

    init() {
        self.data = Layer1{
            nested: Layer2{
                inner: Layer3{ z: true }
            }
        };
    }
}