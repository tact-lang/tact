struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    x: InnerOpt?;
}

contract OptionalStructNested {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            x: null
        };
    }
}