struct OptionalLayer2 {
    inn: Int?;
}

struct OptionalLayer1 {
    layer2: OptionalLayer2?;
}

contract DoubleOptional {
    val: OptionalLayer1?;

    init() {
        self.val = null;
    }
}
