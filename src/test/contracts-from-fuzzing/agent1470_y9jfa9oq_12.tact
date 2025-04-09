struct OptionalInner {
    text: String?;
}

struct Middle {
    option: OptionalInner?;
}

struct Outer {
    middle: Middle?;
}

contract NullableDepth3 {
    payload: Outer;

    init() {
        self.payload = Outer{
            middle: Middle{
                option: OptionalInner{
                    text: null,
                },
            },
        };
    }
}