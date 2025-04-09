struct NestedOptionalStruct {
    a: Int?;
    b: String?;
    c: Bool;
}

struct OuterStruct {
    optInner: NestedOptionalStruct?;
    d: Int;
}

contract TestContract {
    outer: OuterStruct = OuterStruct{
        optInner: null,
        d: 42
    };

    receive() {
        let _ = self.outer;
    }
}