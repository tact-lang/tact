struct IntString {
    i: Int;
    s: String;
}

struct S1 {
    a: IntString;
    b: IntString;
}

struct S2 {
    x: S1;
    y: S1;
}

contract TestContract {
    bigNested: S2;

    init() {
        self.bigNested = S2{
            x: S1{ a: IntString{i:1,s:"a"}, b: IntString{i:2,s:"b"} },
            y: S1{ a: IntString{i:3,s:"c"}, b: IntString{i:4,s:"d"} }
        };
    }
}
