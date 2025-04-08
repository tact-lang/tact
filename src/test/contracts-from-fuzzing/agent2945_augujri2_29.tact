struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

struct ABC {
    a: A;
    b: B;
    c: C;
}

contract Combo {
    x: ABC;

    init() {
        self.x = ABC{a:A{a:1}, b:B{b:true}, c:C{c:"hi"}};
    }
}