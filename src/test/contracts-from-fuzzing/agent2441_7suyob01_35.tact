struct OptLayer1 {
    foo: Int?;
    layer2: OptLayer2?;
}

struct OptLayer2 {
    bar: Int?;
    layer3: OptLayer3?;
}

struct OptLayer3 {
    baz: Int?;
}

contract OptionLadder {
    val: OptLayer1?;

    init() {
        self.val = null;
    }
}