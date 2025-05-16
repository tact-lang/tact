contract NestedOptionalStruct {
    data: Int? = 2;
    info: String? = null;

    init() {
        self.data = 1;
        self.info = null;
    }

    receive() {
        let _ = self.data;
    }
}