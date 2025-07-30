contract DefaultContract {
    intWithDefault: Int = 7;
    strWithDefault: String = "val";
    boolWithDefault: Bool = true;

    init() {
        self.intWithDefault = 14;
        self.strWithDefault = "changed";
        self.boolWithDefault = false;
    }

    receive() {}
}