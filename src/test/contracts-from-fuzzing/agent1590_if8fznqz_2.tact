struct InnerStruct {
    a: Int;
    b: Bool?;   
}

struct OuterStruct {
    s: InnerStruct;
    text: String?;
}

contract Test {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            s: InnerStruct{
                a: 777,
                b: null
            },
            text: null
        };
    }
}