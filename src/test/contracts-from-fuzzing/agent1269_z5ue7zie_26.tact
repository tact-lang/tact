struct HasString {
    s: String;
}

struct HasBool {
    b: Bool;
}

struct HasInt {
    i: Int;
}

contract TestContract {
    str: HasString;
    bl: HasBool;
    inum: HasInt;

    init() {
        self.str = HasString{s: "hello"};
        self.bl = HasBool{b: true};
        self.inum = HasInt{i: 42};
    }
}