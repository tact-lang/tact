struct OptionalDeep {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct NestLevel2 {
    optStruct: OptionalDeep;
    val: Int;
}

contract DeepNestedVars {
    data: NestLevel2;

    init() {
        self.data = NestLevel2{
            optStruct: OptionalDeep{
                x: null,
                y: null,
                z: null,
            },
            val: 100,
        };
    }
}
