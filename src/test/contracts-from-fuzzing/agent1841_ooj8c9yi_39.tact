struct DeepStruct {
    nested: Level1;
}

struct Level1 {
    nested2: Level2;
    value1: Int;
}

struct Level2 {
    nested3: Level3;
    value2: String;
}

struct Level3 {
    boolVal: Bool;
    strVal: String;
}

contract FinalTest {
    field: DeepStruct;

    init() {
        self.field = DeepStruct{
            nested: Level1{
                nested2: Level2{
                    nested3: Level3{boolVal:true,strVal:"end"},
                    value2: "v2"
                },
                value1: 1
            }
        };
    }
}
