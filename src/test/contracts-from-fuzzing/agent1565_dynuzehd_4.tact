struct Combine {
    n: Int;
    b: Bool;
    s: String;
    o1: Int?;
    o2: String?;
    nested: Nested;
    nestedOpt: Nested?;
}

struct Nested {
    flag: Bool;
    label: String;
}

contract ComboContract {
    data: Combine;

    init() {
        self.data = Combine{
            n: 9,
            b: false,
            s: "foo",
            o1: null,
            o2: "bar",
            nested: Nested{
                flag: true,
                label: "hi",
            },
            nestedOpt: null,
        };
    }
}