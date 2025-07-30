struct S1 { f: Int as uint32; }
struct S2 { f: Int as uint64; }
struct DifferentWidth {
    a: S1;
    b: S2;
}

contract IntWidths {
    data: DifferentWidth;

    init() {
        self.data = DifferentWidth{
            a: S1{f:123},
            b: S2{f:9999999999}
        };
    }
}