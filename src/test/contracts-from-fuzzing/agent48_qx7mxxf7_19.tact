struct Inner1 {
    flag: Bool;
}
struct Inner2 {
    f: Int;
}

struct Outer {
    s1: Inner1;
    s2: Inner2;
}

contract MultiNestedStruct {
    val: Outer;

    init() {
        self.val = Outer{
            s1: Inner1{ flag: true },
            s2: Inner2{ f: 123 }
        };
    }
}
