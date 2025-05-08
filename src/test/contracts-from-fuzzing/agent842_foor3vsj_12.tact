struct InnerStr {
    text: String;
    number: Int;
}

struct OuterOpt {
    value: Int;
    nested: InnerStr?;
}

contract NestedOptionalStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            value: 11,
            nested: null
        };
    }

    receive() {
        let _ = self.data;
    }
}