struct Egg {
    e1: Int;
    e2: Bool?;
}

struct Yolk {
    y1: Egg;
    y2: Egg?;
    y3: Int?;
}

struct Shell {
    outer: Yolk;
    middle: Yolk?;
    inner: Yolk?;
}

contract Layered {
    content: Shell;

    init() {
        self.content = Shell{
            outer: Yolk{
                y1: Egg{e1:7, e2:null},
                y2: null,
                y3: null
            },
            middle: null,
            inner: null
        };
    }
}