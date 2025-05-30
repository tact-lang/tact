struct Sub {
    x: Int;
}

struct Middle {
    sub: Sub;
}

contract ChainNested {
    middle: Middle;

    init() {
        self.middle = Middle{
            sub: Sub{ x: 99 }
        };
    }
}