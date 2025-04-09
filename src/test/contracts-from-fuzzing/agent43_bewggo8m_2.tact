struct GrandChild {
    value: Int = 10;
    optBool: Bool?;
}

struct Child {
    nested: GrandChild;
    flag: Bool = false;
}

struct Parent {
    nested: Child;
    text: String;
}

contract TestContract {
    p: Parent;

    init() {
        self.p = Parent{
            nested: Child{
                nested: GrandChild{
                    value: 123,
                    optBool: true
                },
                flag: true
            },
            text: "deep"
        };
    }
}