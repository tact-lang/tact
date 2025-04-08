struct NestedOptional {
    val: Int?; 
}

struct InnerStruct {
    opt: NestedOptional;
    flag: Bool; 
}

contract DeepOptionalTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            opt: NestedOptional{ val: null },
            flag: true
        };
    }
}