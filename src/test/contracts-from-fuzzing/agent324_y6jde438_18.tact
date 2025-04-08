struct AInner {
    a: Int;
}

struct BInner {
    b: Bool;
}

struct SDualNested {
    ain: AInner;
    bin: BInner;
}

contract DualStructContract {
    s: SDualNested;

    init() {
        self.s = SDualNested{
            ain: AInner{a:77},
            bin: BInner{b:true}
        };
    }
}