struct InnerStruct {
    val1: Int;
    val2: Bool?;
}

struct OuterStruct {
    nested: InnerStruct?;
    text: String;
    flag: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: null,
            text: "test",
            flag: true,
        };
    }
}