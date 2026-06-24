struct DefaultVals {
    x: Int = 5;
    y: Bool = true;
    s: String = "default";
    opt: Int?;
}

contract DefaultValuesStorage {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}
