struct BoolDefault {
    b: Bool = false;
}

contract BoolDefaultContract {
    val: BoolDefault;

    init() {
        self.val = BoolDefault{};
    }
}