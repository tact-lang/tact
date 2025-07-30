struct Str1 {
    a: Int;
}

struct Str2 {
    b: Str1;
}

contract InitOrder {
    s: Str2;
    x: Int = 77;
    y: String;

    init() {
        self.s = Str2{ b: Str1{ a: 33 } };
        self.y = "done";
    }
}