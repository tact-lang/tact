struct A {
    s: String;
}

struct B {
    a: A;
    b: A;
    c: A;
    d: A;
    e: A;
}

contract Test {
    data: B;

    init() {
        self.data = B{
            a: A{s: "1"}, b: A{s:"2"}, c:A{s:"3"}, d:A{s:"4"}, e:A{s:"5"}
        };
    }
}