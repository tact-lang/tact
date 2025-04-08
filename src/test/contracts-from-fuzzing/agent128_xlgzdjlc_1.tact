struct DeepOptional {
    level1: Int?;
    level2: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    val: Int;
    flag: Bool?;
}

contract TestContract {
    data: DeepOptional;
    
    init() {
        self.data = DeepOptional{
            level1: null,
            level2: 42,
            sub: SubStruct{
                val: 5,
                flag: true
            }
        };
    }
}