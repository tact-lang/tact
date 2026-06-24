struct Deep {
    a: Int;
    b: String;
}

struct Middle {
    first: Deep;
    second: Deep;
}

struct Outer {
    x: Middle;
    y: Middle;
}

contract DuplicatedNested {
    root: Outer;

    init() {
        self.root = Outer{
            x: Middle{
                first: Deep{a:1,b:"a"},
                second: Deep{a:2,b:"b"}
            },
            y: Middle{
                first: Deep{a:3,b:"c"},
                second: Deep{a:4,b:"d"}
            }
        };
    }
}