struct Chain {
    a: AA;
}

struct AA {
    b: BB;
}

struct BB {
    c: CC;
}

struct CC {
    d: DD;
}

struct DD {
    e: EE;
}

struct EE {
    f: FF;
}

struct FF {
    g: GG;
}

struct GG {
    val: Int;
}

contract SevenLevels {
    field: Chain;

    init() {
        self.field = Chain{a:AA{b:BB{c:CC{d:DD{e:EE{f:FF{g:GG{val:1}}}}}}}};
    }
}