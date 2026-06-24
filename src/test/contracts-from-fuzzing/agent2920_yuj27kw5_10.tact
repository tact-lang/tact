struct OptionLayer3 {
    val: Int?;
}

struct OptionLayer2 {
    inner: OptionLayer3?;
}

struct OptionLayer1 {
    inner: OptionLayer2?;
}

contract DeepOptionals {
    layer: OptionLayer1;

    init() {
        self.layer = OptionLayer1{ inner: null };
    }
}