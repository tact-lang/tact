struct Example {
    a: Int;
    b: Bool;
    c: Example2;
}

struct Example2 {
    x: Int;
    y: Bool;
}

contract ManyStructs {
    e: Example;

    init() {
        self.e = Example{
            a: 1,
            b: true,
            c: Example2 { x: 2, y: false }
        };
    }
}