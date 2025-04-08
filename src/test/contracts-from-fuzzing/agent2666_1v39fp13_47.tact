struct NestedBool {
    b: Bool;
}

struct NestedString {
    s: String;
}

contract HasStructs {
    s1: NestedBool;
    s2: NestedString;

    init() {
        self.s1 = NestedBool{b:true};
        self.s2 = NestedString{s:"hello"};
    }
}