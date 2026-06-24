struct Top {
    sub: Mid;
}

struct Mid {
    subsub: Bottom;
}

struct Bottom {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    top: Top;

    init() {
        self.top = Top{
            sub: Mid{
                subsub: Bottom{a:123,b:true,c:"hi"}
            }
        };
    }
}