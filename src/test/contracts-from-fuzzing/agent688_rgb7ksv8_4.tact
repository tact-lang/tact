struct Child {
    foo: Int?;
    bar: Bool?;
}

struct Parent {
    child: Child?;
    note: String;
}

contract OptNestedStructs {
    data: Parent;

    init() {
        self.data = Parent{
            child: Child{
                foo: 123,
                bar: null
            },
            note: "hi"
        };
    }
}
