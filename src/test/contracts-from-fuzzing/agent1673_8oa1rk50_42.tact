struct SDefault {
    a: Int = 1;
    b: Bool = true;
}

contract DefaultValsContract {
    val: SDefault;

    init() {
        self.val = SDefault{};
    }
}