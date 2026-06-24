struct Data {
    x: Int;
    flag: Bool;
    txt: String;
}

contract StructField {
    data: Data;

    init() {
        self.data = Data{ x: 7, flag: true, txt: "foo" };
    }
}