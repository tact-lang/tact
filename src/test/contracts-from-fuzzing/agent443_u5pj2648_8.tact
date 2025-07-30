struct SubStruct { f1: Bool; f2: String; }

struct ComplexNested {
    first: Int;
    inner: SubStruct;
    optInner: SubStruct?;
    last: Int;
}

contract ComplexFields {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            first: 5,
            inner: SubStruct{f1:true, f2:"hello"},
            optInner: null,
            last: 99
        };
    }
}