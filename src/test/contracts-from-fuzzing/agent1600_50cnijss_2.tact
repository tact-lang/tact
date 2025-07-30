struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    maybeInner: InnerStruct?;
    flag: Bool;
}

contract TestContract {
    info: OuterStruct;

    init() {
        self.info = OuterStruct{
            maybeInner: InnerStruct{ a: 7, b: false },
            flag: true
        };
    }
}