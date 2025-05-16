struct Rec {
    flag: Bool = false;
    val: Int = 0;
}

struct Wrap {
    rec: Rec;
    opt: Int?;
    val: Bool = true;
}

contract MultiType {
    field: Wrap;

    init() {
        self.field = Wrap{
            rec: Rec{flag: true, val: 7},
            opt: null,
            val: false
        };
    }
}