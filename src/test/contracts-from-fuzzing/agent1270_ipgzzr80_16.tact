struct Inner1 { a: Int }
struct Inner2 { b: Int }
struct Inner3 { c: Int }

struct Nested {
    one: Inner1;
    two: Inner2;
    three: Inner3;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            one: Inner1{a: 1},
            two: Inner2{b: 2},
            three: Inner3{c: 3}
        };
    }
}