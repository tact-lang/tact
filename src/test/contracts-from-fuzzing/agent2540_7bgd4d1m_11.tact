struct Base1 {
    a: Int;
}

struct Base2 {
    b: String;
}

struct Combine {
    s1: Base1;
    s2: Base2;
    n: Int;
}

contract CombinedStructs {
    data: Combine;

    init() {
        self.data = Combine{
            s1: Base1{a: 10},
            s2: Base2{b: "hi"},
            n: 20
        };
    }
}