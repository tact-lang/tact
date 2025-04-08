struct DeepFields {
    s: String;
    deeperOpt: Int?;
}

struct Level1 {
    deepStruct: DeepFields;
}

contract SubStructs {
    level1: Level1;

    init() {
        self.level1 = Level1{
            deepStruct: DeepFields{
                s: "x",
                deeperOpt: null,
            },
        };
    }
}