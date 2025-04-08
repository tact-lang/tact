struct WrappedString {
    s: String;
}

contract StringField {
    val: WrappedString;
    
    init() {
        self.val = WrappedString { s: "Hello, world!" };
    }
}
