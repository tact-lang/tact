struct Param {
    value: Int?;
    meaning: String = "life";
    flag: Bool = false;
}

contract StorageWithDefaults {
    param: Param;

    init() {
        self.param = Param{
            value: null
        };
    }
}
