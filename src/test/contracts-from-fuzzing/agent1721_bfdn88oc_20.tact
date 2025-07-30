struct DeepStruct {
    level: Int;
    nested: NestedStruct;
}

struct NestedStruct {
    flag: Bool;
    deepStr: String;
    deeper: DeeperStruct;
}

struct DeeperStruct {
    info: String;
    num: Int;
}

contract DeepEmbeddedStrings {
    root: DeepStruct;

    init() {
        self.root = DeepStruct{
            level:1,
            nested: NestedStruct{
                flag:true,
                deepStr:"hello",
                deeper: DeeperStruct{
                    info:"world",
                    num:42
                }
            }
        };
    }
}
