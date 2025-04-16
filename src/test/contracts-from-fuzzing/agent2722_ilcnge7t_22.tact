contract FieldsWithDefaultInit {
    count: Int = 0;
    flag: Bool = true;
    label: String = "label";
    note: String? = null;
    optNum: Int? = null;
    optFlag: Bool? = null;

    init() {
        self.count = 10;
        self.flag = false;
        self.label = "done";
        self.note = "note";
        self.optNum = 123;
        self.optFlag = true;
    }
}