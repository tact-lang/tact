struct IntStrBool {
    a: Int;
    b: String;
    c: Bool;
}

contract MultiFieldTypes {
    data: IntStrBool;

    init() {
        self.data = IntStrBool{a:1, b:"hello", c:true};
    }
}