struct Nullable {
    x: Int? = null;
}

contract Test {
    val: Nullable;
    init() {
        self.val = Nullable{ x: null };
    }
}