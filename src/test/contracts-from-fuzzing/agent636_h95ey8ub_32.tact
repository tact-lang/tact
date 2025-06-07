struct Inner1 {
    val: Int;
}
struct Inner2 {
    val: Bool;
}
struct Inner3 {
    val: String;
}

struct Outermost {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract DifferentNestedStructs {
    nested: Outermost;

    init() {
        self.nested = Outermost{
            i1: Inner1{val: 11},
            i2: Inner2{val: true},
            i3: Inner3{val: "hi"}
        };
    }
}