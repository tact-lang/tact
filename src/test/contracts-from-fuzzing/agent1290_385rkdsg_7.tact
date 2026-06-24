struct InnerMost {
    s: String;
}

struct InnerOptional {
    nested: InnerMost?; 
    flag: Bool;
}

struct Container {
    nestedOpt: InnerOptional;
    number: Int;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            nestedOpt: InnerOptional{ nested: null, flag: false },
            number: 0
        };
    }

    receive() {
        self.val = Container{
            nestedOpt: InnerOptional{ nested: InnerMost{ s: "test" }, flag: true },
            number: 42
        };
    }
}