struct MixOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Bool?;
    f: Int;
}

contract TestMixOptionals {
    s: MixOptionals;
    init() {
        self.s = MixOptionals{
            a:null,
            b:true,
            c:null,
            d: emptyCell(),
            e:null,
            f:42
        };
    }
}