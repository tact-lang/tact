struct Struct1 {
    x: Int;
    y: String;
}

struct Struct2 {
    a: Bool;
    b: Struct1;
}

contract DefaultInit {
    s: Struct2;

    init() {
        self.s = Struct2 {
            a: true,
            b: Struct1 { x: 10, y: "hello" }
        };
    }
}