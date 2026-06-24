struct ArrLayer3 {
    text: String;
}

struct ArrLayer2 {
    nested: ArrLayer3;
    another: String;
}

struct ArrLayer1 {
    deep: ArrLayer2;
    count: Int;
}

contract MultiLayerStruct {
    data: ArrLayer1;

    init() {
        self.data = ArrLayer1{
            deep: ArrLayer2{
                nested: ArrLayer3{
                    text: "deepest",
                },
                another: "layer2",
            },
            count: 17,
        };
    }
}