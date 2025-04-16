struct InnerRec {
    x: Int;
}

struct OuterRec {
    y: InnerRec;
}

contract PersistentDirect {
    direct: OuterRec;

    init() {
        self.direct = OuterRec{
            y: InnerRec{ x: 123 },
        };
    }
}