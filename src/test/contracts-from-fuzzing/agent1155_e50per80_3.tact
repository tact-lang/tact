struct WithOptionalNested {
    s: String;
    opt: Nested?;
}

struct Nested {
    x: Int;
    y: Bool;
    s2: String;
}

contract TestContract {
    data: WithOptionalNested;

    init() {
        self.data = WithOptionalNested{
            s: "hi",
            opt: Nested{
                x: 7,
                y: false,
                s2: "nested"
            }
        };
    }
}
