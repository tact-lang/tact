struct AStruct {
    f: Int;
}

contract ReorderFields {
    num: Int;
    nested: AStruct;
    flag: Bool;
    text: String;

    init() {
        self.num = 1;
        self.nested = AStruct{f: 42};
        self.flag = true;
        self.text = "test";
    }
}
