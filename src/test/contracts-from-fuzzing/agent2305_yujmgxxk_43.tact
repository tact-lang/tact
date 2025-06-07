struct IntStringBool {
    a: Int;
    b: String;
    c: Bool;
}

contract FieldsIntStringBool {
    field: IntStringBool;

    init() {
        self.field = IntStringBool{
            a:10, b:"abc", c:true
        };
    }
}
