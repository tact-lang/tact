struct Base {
    f1: Int;
}

struct Middle {
    base: Base;
    f2: Bool;
}

struct Top {
    mid: Middle;
    f3: String;
}

contract TopNested {
    field: Top;

    init() {
        self.field = Top{
            mid: Middle{ base: Base{f1:42}, f2:true },
            f3: "!"
        };
    }
}