struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    f1: Int;
    f2: Bool;
    f3: NestedOpt;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container {
            f1: 111,
            f2: false,
            f3: NestedOpt {
                a: null,
                b: true,
                c: "hello"
            }
        };
    }
}