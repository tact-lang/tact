struct IntStringBool {
    i: Int;
    s: String;
    b: Bool;
}

contract TestContract {
    one: IntStringBool;
    two: IntStringBool;
    three: IntStringBool;

    init() {
        self.one = IntStringBool{i:1,s:"a",b:true};
        self.two = IntStringBool{i:2,s:"b",b:false};
        self.three = IntStringBool{i:3,s:"c",b:true};
    }
}