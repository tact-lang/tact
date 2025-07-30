struct Mid {
    middle: Int;
}

struct Top {
    foo: Int;
    mid: Mid?;
}

contract OptNestedMid {
    s: Top;

    init() {
        self.s = Top{
            foo:0,
            mid:null
        };
    }

    receive() {
        let _=self.s;
    }
}