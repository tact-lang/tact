struct Sub {
    a: Int;
    b: Bool;
}

struct Main {
    x: Int;
    y: Bool;
    z: Sub;
    s: String;
}

contract MixedTypes {
    data: Main;

    init() {
        self.data = Main {
            x: 42,
            y: true,
            z: Sub { a:1, b:false },
            s: "hello"
        };
    }
}