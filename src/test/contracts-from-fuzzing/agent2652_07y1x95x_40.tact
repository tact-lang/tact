struct StructWithString {
    message: String;
}

contract StringPersistence {
    val: StructWithString;
    init() {
        self.val = StructWithString{ message: "Hello world" };
    }
}