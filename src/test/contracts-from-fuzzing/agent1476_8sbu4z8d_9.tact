struct DefaultVals {
    x: Int = 1;
    y: Bool = false;
    z: String = "zzz";
}

contract DefaultsPersistent {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}