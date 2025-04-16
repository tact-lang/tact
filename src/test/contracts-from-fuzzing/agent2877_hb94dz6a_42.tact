struct StrCnt {
    s: String;
    c: Cell;
    sl: Slice;
}

contract MixComplex {
    a: StrCnt;

    init() {
        self.a = StrCnt{
            s: "some string",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}