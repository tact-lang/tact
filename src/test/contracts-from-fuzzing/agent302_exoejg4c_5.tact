struct Inner {
    flag: Bool?;
}

struct Middle {
    node: Inner?;
}

struct Outer {
    branch: Middle?;
}

contract OptChainTest {
    x: Outer;

    init() {
        self.x = Outer{
            branch: Middle{
                node: Inner{
                    flag: null
                }
            }
        };
    }
}