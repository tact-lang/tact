struct InnerStruct {
    flag: Bool;
    count: Int;
}

struct OuterStruct {
    inn: InnerStruct;
    maybeInner: InnerStruct?;
    number: Int;
}

contract OptionalInside {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inn: InnerStruct{flag:true, count:1},
            maybeInner: null,
            number: 7
        };
    }
}