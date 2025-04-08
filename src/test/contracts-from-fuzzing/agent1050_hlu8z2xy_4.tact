struct Layer3 {
    v1: Int;
    v2: String?;
}

struct Layer2 {
    inner: Layer3;
    opt: Bool?;
}

struct Layer1 {
    inner: Layer2;
}

contract MultiOptNested {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            inner: Layer2{
                inner: Layer3{
                    v1: 5,
                    v2: null,
                },
                opt: true,
            }
        };
    }
}
