struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    s: NestedOpt?;
    num: Int;
}

contract OptNested {
    val: Container;

    init() {
        self.val = Container{
            s: null,
            num: 100,
        };
    }

    receive() {}
}