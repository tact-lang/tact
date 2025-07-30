// mix nested fields, contract fields style
struct A {
    x: Int;
    y: Bool;
}

struct B {
    m: A;
    n: Int;
}

struct C {
    q: B;
    r: String;
}

contract NestedFields {
    data: C;

    init() {
        self.data = C {
            q: B {
                m: A { x:5, y:true },
                n:7
            },
            r: "R"
        };
    }
}