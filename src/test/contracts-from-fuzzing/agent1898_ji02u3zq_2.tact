struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct Container {
    nested: NestedOpt;
    s: String;
}

contract NestedStructsContract {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOpt{ a: null, b: true },
            s: "test"
        };
    }
}