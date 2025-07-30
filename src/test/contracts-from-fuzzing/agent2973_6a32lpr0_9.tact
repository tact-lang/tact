struct BigNestedStruct {
    i: Int;
    s: String;
    inner: InnerStruct;
}

struct InnerStruct {
    b: Bool;
    n: Int?;
    str: String?;
}

contract NestedFields {
    big: BigNestedStruct;
    
    init() {
        self.big = BigNestedStruct{
            i: 1,
            s: "nested",
            inner: InnerStruct{
                b: true,
                n: null,
                str: null
            }
        };
    }
}