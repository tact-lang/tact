struct InnerOpt {
    x: Int?;
    y: Bool;
}

struct Middle {
    innerOpt: InnerOpt;
    z: String;
}

contract NestedOptionals {
    m: Middle;

    init() {
        self.m = Middle{
            innerOpt: InnerOpt{
                x: 99,
                y: false,
            },
            z: "Hello",
        };
    }
}