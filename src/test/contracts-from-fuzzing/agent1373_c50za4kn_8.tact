struct Middle {
    leaf: Int?;
}

struct Outer {
    middle: Middle?;
}

contract Test {
    node: Outer;

    init() {
        self.node = Outer{
            middle: Middle{
                leaf: 999
            }
        };
    }
}