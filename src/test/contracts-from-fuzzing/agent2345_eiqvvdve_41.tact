struct AAA {
    x:Int;
}

struct BBB {
    y:Int;
}

struct CCC {
    a:AAA;
    b:BBB;
}

struct WrapAll {
    c:CCC;
}

contract StructsWrap {
    f:WrapAll;

    init() {
        self.f = WrapAll{ c: CCC{ a: AAA{ x:1 }, b: BBB{ y:2 }}};
    }
}