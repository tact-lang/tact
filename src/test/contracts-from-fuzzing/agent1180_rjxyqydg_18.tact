struct First {
    f: Int;
}
struct Second {
    s: Bool;
}
struct Third {
    t: String;
}

contract ManyStructs {
    one: First;
    two: Second;
    three: Third;

    init() {
        self.one = First{f: 1};
        self.two = Second{s: true};
        self.three = Third{t: "hi"};
    }
}
