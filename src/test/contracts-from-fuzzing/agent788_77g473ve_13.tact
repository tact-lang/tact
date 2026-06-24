struct InnerOne {
    x: Int;
    y: Bool;
}

struct InnerTwo {
    u: Int;
    v: Bool;
}

struct OuterUnion {
    first: InnerOne?;
    second: InnerTwo?;
}

contract OptionalUnion {
    main: OuterUnion;

    init() {
        self.main = OuterUnion{
            first: InnerOne{ x: 1, y: true },
            second: null
        };
    }
}
