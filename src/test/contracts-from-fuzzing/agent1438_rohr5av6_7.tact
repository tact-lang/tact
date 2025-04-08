struct InnerOpt {
    x: Int?;
    y: Int;
}

struct OuterOpt {
    v: InnerOpt?;
    z: Int;
}

contract OptNested {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            v: InnerOpt{
                x: null,
                y: 10,
            },
            z: 20
        };
    }
}