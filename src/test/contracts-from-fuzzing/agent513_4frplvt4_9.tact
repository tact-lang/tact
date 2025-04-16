struct OptNested {
    foo: Int?;
    bar: Bool?;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract Test {
    opt: OptNested;

    init() {
        self.opt = OptNested{
            foo: null,
            bar: true,
            nested: Inner{
                x: 42,
                y: "yo"
            }
        };
    }

    receive() {}
}