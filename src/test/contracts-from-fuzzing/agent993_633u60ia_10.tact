struct InnerStruct {
    val: Int;
    flag: Bool;
}

struct OuterStruct {
    a: Int;
    b: Int?;
    c: InnerStruct?;
    d: String;
}

contract TestContract {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            a: 5,
            b: null,
            c: null,
            d: "test"
        };
    }
}