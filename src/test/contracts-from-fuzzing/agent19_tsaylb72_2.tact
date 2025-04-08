struct DeepNested {
    a: Int;
    b: Bool?;
    c: String;
}

struct Wrapper {
    nested: DeepNested;
    flag: Bool;
}

contract NestedStructContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: DeepNested{
                a: 77,
                b: null,
                c: "X",
            },
            flag: true,
        };
    }
}
