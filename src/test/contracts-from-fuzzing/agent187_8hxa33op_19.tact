contract WithTopLevelConsts {
    const CONST_INT: Int = 42;
    const CONST_BOOL: Bool = true;
    const CONST_STRING: String = "hello";

    dummy: Int;

    init() {
        self.dummy = self.CONST_INT;
    }
}
