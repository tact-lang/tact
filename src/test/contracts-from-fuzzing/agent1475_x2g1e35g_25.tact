struct SDefault {
    x: Int = 1;
    y: Bool = true;
    z: String = "x";
}

contract DefaultVals {
    val: SDefault;

    init() {
        self.val = SDefault{};
    }
}