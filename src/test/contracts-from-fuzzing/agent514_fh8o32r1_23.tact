struct InnerStruct {
    x: Int;
    y: String;
}

struct OuterStruct {
    inn: InnerStruct;
    flag: Bool;
}

contract NestedStructFields {
    data: OuterStruct;
    init() {
        self.data = OuterStruct{
            inn: InnerStruct{ x:42, y:"hi" },
            flag: true
        };
    }
}