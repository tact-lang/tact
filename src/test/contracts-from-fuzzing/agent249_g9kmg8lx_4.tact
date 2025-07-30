struct B {
    x: Int;
    y: Bool;
}

struct C {
    s: String;
    flag: Bool?;
}

struct A {
    b: B;
    c: C;
    note: String?;
}

contract DeepNest {
    data: A;

    init() {
        self.data = A{
            b: B{x: 1, y: true},
            c: C{s: "hi", flag: null},
            note: "end"
        };
    }

    receive() {
        let _ = self.data.b.x;
    }
}