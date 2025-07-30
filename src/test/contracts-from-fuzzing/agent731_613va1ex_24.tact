struct Combined {
    i: Int;
    b: Bool;
    s: String;
}

contract MixedInline {
    a: Int;
    c: Combined;
    flag: Bool;
    text: String;

    init() {
        self.a = 42;
        self.c = Combined{ i: 1, b: false, s: "hi" };
        self.flag = true;
        self.text = "t";
    }
}