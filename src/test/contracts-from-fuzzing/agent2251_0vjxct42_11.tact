struct OptionLayer3 {
    val3: Int?;
}

struct OptionLayer2 {
    val2: OptionLayer3?;
}

struct OptionLayer1 {
    val1: OptionLayer2?;
}

contract MultiOptionalContract {
    data: OptionLayer1?;

    init() {
        self.data = null;
    }
}