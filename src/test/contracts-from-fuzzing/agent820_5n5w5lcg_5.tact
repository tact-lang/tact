struct Inner1 { a: Int; }
struct Inner2 { b: Inner1; }
struct Inner3 { c: Inner2; }

struct HasMultipleNested {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
}

contract TestContract {
    value: HasMultipleNested;
    init() {
        self.value = HasMultipleNested{
            f1: Inner1{a: 1},
            f2: Inner2{b: Inner1{a: 2}},
            f3: Inner3{c: Inner2{b: Inner1{a: 3}}},
        };
    }
}