struct InnerString {
    s: String;
}

contract StructWithString {
    val: InnerString;
    
    init() {
        self.val = InnerString{ s: "hello" };
    }
}