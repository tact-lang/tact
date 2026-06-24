struct Innermost {
    z: Int;
}

struct Middle {
    y: Innermost;
}

struct Upper {
    x: Middle;
}

contract Chain {
    chain: Upper;

    init() {
        self.chain = Upper{
            x: Middle{
                y: Innermost{
                    z: 101
                }
            }
        };
    }
}
