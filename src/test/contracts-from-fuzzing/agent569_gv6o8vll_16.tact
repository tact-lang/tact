struct HasString {
    s: String; 
}

contract TestStringField {
    field: HasString;
    init() {
        self.field = HasString{ s: "hi!" };
    }
}