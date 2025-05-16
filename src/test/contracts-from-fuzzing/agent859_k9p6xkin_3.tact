struct InnerData {
    num: Int;
    flag: Bool;
    note: String;
}

contract TestNested {
    info: InnerData?;

    init() {
        self.info = InnerData{ num: 42, flag: true, note: "hello" };
    }
}