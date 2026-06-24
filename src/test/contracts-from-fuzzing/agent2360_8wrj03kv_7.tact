struct NestedInsideOptional {
    innerStruct: NestedType?;
}

struct NestedType {
    val: Int;
    flag: Bool;
    text: String;
}

contract DeepOpt {
    data: NestedInsideOptional;
    init() {
        self.data = NestedInsideOptional{
            innerStruct: NestedType{
                val: 10,
                flag: false,
                text: "hi"
            }
        };
    }
}