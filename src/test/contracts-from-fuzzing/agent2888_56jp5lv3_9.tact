// Deep optional inside nested struct
struct Sub {
    foo: Bool?;
    bar: Int?;
}

struct NestedOpt {
    sub: Sub?;
    message: String;
}

contract DeepOptionalField {
    state: NestedOpt;

    init() {
        self.state = NestedOpt{
            sub: null,
            message: "hello",
        };
    }
}