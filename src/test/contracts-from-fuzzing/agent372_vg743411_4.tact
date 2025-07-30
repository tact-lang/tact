struct OptionalData {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract Test {
    opt: OptionalData;
    init() {
        self.opt = OptionalData{
            val1: null,
            val2: true,
            val3: null
        };
    }
}