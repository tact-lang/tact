struct StructWithString {
    s: String;
}

contract PersistentString {
    val: StructWithString;

    init() {
        self.val = StructWithString{ s: "hello world" };
    }
}