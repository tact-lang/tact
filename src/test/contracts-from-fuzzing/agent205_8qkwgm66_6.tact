struct SomeData {
    a: Int;
    b: String;
    c: Bool;
}

contract OptionalStateFields {
    val1: SomeData?;
    val2: Int?;
    val3: Bool?;
    val4: String?;

    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
        self.val4 = null;
    }
}