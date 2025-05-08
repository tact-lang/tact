struct OptionalLevel3 {
    val: Int?;
}

struct OptionalLevel2 {
    val: OptionalLevel3?;
}

struct OptionalLevel1 {
    val: OptionalLevel2?;
}

contract MultiLayerOptional {
    data: OptionalLevel1;

    init() {
        self.data = OptionalLevel1{val: null};
    }
}