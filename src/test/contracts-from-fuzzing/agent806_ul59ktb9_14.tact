struct Layer3 {
    foo: Int;
}

struct Layer2 {
    a: Int;
    l3: Layer3;
}

struct Layer1 {
    s: String;
    l2: Layer2;
}

contract MultiDepth {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            s: "hello",
            l2: Layer2{
                a: 123,
                l3: Layer3{foo: 456}
            }
        };
    }
}