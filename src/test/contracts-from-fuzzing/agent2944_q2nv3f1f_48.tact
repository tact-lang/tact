struct Bottom {
    n: Int;
}

struct Middle {
    b: Bottom;
}

struct Outer {
    m: Middle;
}

contract ComposeEverything {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                b: Bottom{
                    n: 1
                }
            }
        };
    }
}