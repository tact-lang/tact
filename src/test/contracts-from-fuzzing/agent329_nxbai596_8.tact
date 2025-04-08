struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Int;
}
struct Inner3 {
    c: Int;
}
struct Inner4 {
    d: Int;
}

struct Nested {
    one: Inner1;
    two: Inner2;
    three: Inner3;
    four: Inner4;
}

contract TestContract {
    nest: Nested;
    init() {
        self.nest = Nested{
            one: Inner1{a:1},
            two: Inner2{b:2},
            three: Inner3{c:3},
            four: Inner4{d:4},
        };
    }
}