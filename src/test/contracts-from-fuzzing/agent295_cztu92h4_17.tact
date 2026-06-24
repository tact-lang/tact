// Nested optional inside struct's optional field: single nesting allowed
struct Inner1 {
    foo: Int?;
}

struct OuterOpt {
    data: Inner1?;
}

contract OptionalInsideOptionalStruct {
    state: OuterOpt = OuterOpt{
        data: null,
    };

    init() {
        self.state = OuterOpt{
            data: Inner1{ foo: 5 },
        };
    }

    receive() {
        self.state = self.state;
    }
}