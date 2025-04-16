struct Bottom {
    foo: Int?;
}

struct Middle {
    val: Int;
    bottom: Bottom;
}

contract ComplexOptionalStorage {
    data: Middle?;

    init() {
        self.data = null;
    }
}