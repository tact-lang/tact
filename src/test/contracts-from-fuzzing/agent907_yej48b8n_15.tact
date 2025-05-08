struct A { b: Int; }
struct B { b: Int; }
struct C { b: Int; }
struct D { b: Int; }
struct E { b: Int; }

struct Container {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
}

contract ManyStructFields {
    big: Container;

    init() {
        self.big = Container{
            a: A{b:1}, b:B{b:2}, c:C{b:3}, d:D{b:4}, e:E{b:5}
        };
    }
}