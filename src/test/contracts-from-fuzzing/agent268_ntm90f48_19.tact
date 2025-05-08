struct OptionalTop {
    inner: InnerS?;
}

struct InnerS {
    a:Int;
    flag:Bool;
}

contract OptAtTop {
    t: OptionalTop;
    init() {
        self.t = OptionalTop{ inner: null };
    }
}