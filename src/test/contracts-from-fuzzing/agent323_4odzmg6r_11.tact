struct Info {
    data: String;
}

contract Test {
    val1: Int?;
    val2: Bool?;
    val3: Info?;

    init() {
        self.val1 = null;
        self.val2 = true;
        self.val3 = Info{ data: "hi" };
    }
}