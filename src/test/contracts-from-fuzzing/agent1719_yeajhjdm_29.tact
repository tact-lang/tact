struct Rec {
    a: Int;
    b: InnerRec;
}

struct InnerRec {
    c: Int?;
    d: Bool;
}

contract NestedStructRec {
    val: Rec;

    init() {
        self.val = Rec{
            a: 3,
            b: InnerRec{
                c: null,
                d: false
            }
        };
    }
}