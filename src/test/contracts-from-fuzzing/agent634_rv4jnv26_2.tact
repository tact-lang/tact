struct InnerLevel2 {
    x: Int;
    y: Bool;
}

struct InnerLevel1 {
    nested: InnerLevel2;
}

struct DeepStruct {
    deep: InnerLevel1;
}

contract VeryDeepContract {
    val: DeepStruct;

    init() {
        self.val = DeepStruct{
            deep: InnerLevel1{
                nested: InnerLevel2{x: 1, y: true}
            }
        };
    }
}