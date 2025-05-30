struct HasBool {
    f: Bool;
}

struct HasString {
    s: String;
}

struct HasInt {
    i: Int;
}

contract ManyTypes {
    b: HasBool;
    s: HasString;
    i: HasInt;
    init() {
        self.b = HasBool{f:true};
        self.s = HasString{s:"hello"};
        self.i = HasInt{i:42};
    }
}