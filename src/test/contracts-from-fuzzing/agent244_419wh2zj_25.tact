// Test nested structs with default inner optional values

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: InnerOpt = InnerOpt{};
    msg: String;
}

contract DefaultedNestedOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            msg: "hello"
        };
    }
}