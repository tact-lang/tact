struct DeepNest {
    first: Int?;
    second: Bool?;
    third: String?;
}

contract OptStructs {
    val: DeepNest;

    init() {
        self.val = DeepNest{
            first: null,
            second: true,
            third: null
        };
    }
}