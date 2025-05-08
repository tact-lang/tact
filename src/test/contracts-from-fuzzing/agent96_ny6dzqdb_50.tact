// nesting with mixed optional chain
struct Bottom {
    i: Int?;
}
struct Mid {
    b: Bottom?;
}
struct Top {
    m: Mid?;
    flag: Bool;
}

contract Test {
    top: Top;

    init() {
        self.top = Top{
            m: Mid{
                b: null
            },
            flag: false
        };
    }
}