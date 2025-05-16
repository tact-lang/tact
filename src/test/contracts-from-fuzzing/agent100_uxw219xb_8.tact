struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct Container {
    nested: NestedOptionals;
    flag: Bool;
}

contract OptNestedContract {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOptionals{
                a: 123,
                b: null,
                c: "abc",
                d: null
            },
            flag: true
        };
    }
}