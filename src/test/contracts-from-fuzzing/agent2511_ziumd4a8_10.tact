struct OptionalInner {
    s: String?;
    i: Int?;
    b: Bool?;
}

struct OuterOpt {
    one: OptionalInner?;
    two: Int;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            one: OptionalInner{
                s: null,
                i: 777,
                b: true
            },
            two: 42
        };
    }
}