struct NestOpt {
    a: Int?;
    b: Bool;
}

struct OuterOpt {
    nested: NestOpt?;
    title: String;
}

contract TestOuterOpt {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            nested: null,
            title: "Outer"
        };
    }
}