struct WSub {
    s: String;
    f: Bool;
}

struct WMain {
    inner1: WSub;
    inner2: WSub;
}

contract WideNested {
    f: WMain;
    init() {
        self.f = WMain{
            inner1: WSub{ s:"abc", f:true },
            inner2: WSub{ s:"def", f:false }
        };
    }
}
