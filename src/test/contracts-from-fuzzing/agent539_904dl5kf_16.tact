struct NestedOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Container {
    nested: NestedOptionals;
    flag: Bool;
}

contract TestContract {
    c: Container;
    init() {
        self.c = Container{
            nested: NestedOptionals{
                a: null,
                b: null,
                s: null,
            },
            flag: true
        };
    }
}