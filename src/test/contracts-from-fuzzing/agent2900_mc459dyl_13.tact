struct A { f: Int; }
struct B { g: Bool; }
struct C { h: String; }

contract PerType {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{f: 1};
        self.b = B{g: true};
        self.c = C{h: "hi"};
    }
}
