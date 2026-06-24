struct Mix {
    c: Cell;
    s: Slice?;
    t: String;
    cellOpt: Cell?;
    strOpt: String?;
}

contract MixedStruct {
    m: Mix;

    init() {
        self.m = Mix {
            c: emptyCell(),
            s: null,
            t: "hello",
            cellOpt: null,
            strOpt: null
        };
    }
}