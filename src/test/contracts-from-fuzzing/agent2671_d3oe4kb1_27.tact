struct Rec {
    i: Int;
    nested: RecInner;
}

struct RecInner {
    flag: Bool;
    note: String;
}

contract FieldOrder {
    rec: Rec;

    init() {
        self.rec = Rec{
            i: 9,
            nested: RecInner{
                flag: true,
                note: "ok"
            }
        };
    }
}