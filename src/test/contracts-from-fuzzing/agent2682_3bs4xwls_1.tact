struct NestedOptional {
    flag: Bool?; 
    value: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    val1: Int;
    val2: String;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            flag: true,
            value: 42,
            inner: InnerStruct{
                val1: 1,
                val2: "nested"
            }
        };
    }
}
