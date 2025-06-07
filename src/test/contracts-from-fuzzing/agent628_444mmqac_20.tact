struct ABool {
    b: Bool;
}

struct IntStr {
    i: Int;
    s: String;
}

struct Combo {
    first: ABool;
    second: IntStr;
}

contract CrossTypeNested {
    val: Combo;

    init() {
        self.val = Combo{ first: ABool{b:true}, second: IntStr{i:5, s:"xyz"} };
    }
}