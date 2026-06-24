struct InnerStruct {
    val: Int;
    flag: Bool;
}

struct WrapperStruct {
    inner: InnerStruct;
    optInner: InnerStruct?;
    optVal: Int?;
    text: String;
    c: Cell;
}

contract ComplexFields {
    data: WrapperStruct;

    init() {
        self.data = WrapperStruct{
            inner: InnerStruct{ val: 7, flag: true },
            optInner: null,
            optVal: null,
            text: "Hello",
            c: emptyCell()
        };
    }
}
