struct NestedStructs {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    val1: Int;
}

struct Inner2 {
    val2: Bool;
}

contract TestContract {
    complex: NestedStructs;

    init() {
        self.complex = NestedStructs{
            s1: Inner1{val1: 10},
            s2: Inner2{val2: true}
        };
    }
}