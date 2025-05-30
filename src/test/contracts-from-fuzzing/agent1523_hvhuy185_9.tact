struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    sub1: Inner;
    optsub2: Inner?;

    init() {
        self.sub1 = Inner{ x:0, y:false };
        self.optsub2 = null;
    }

    get fun get_struct(): Inner {
        return self.sub1;
    }

    get fun get_opt_struct(): Inner? {
        return self.optsub2;
    }
}