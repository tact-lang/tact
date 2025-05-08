struct A {
    a: Int;
}

struct B {
    b: Int;
    c: A?;
}

contract OptionInsideStruct {
    val: B;

    init() {
        self.val = B{
            b: 1,
            c: null
        };
    }
}