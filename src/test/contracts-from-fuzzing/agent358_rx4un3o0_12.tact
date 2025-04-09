struct Inner1 {
    a: Int?;
}

struct Inner2 {
    b: Inner1;
}

struct Inner3 {
    c: Inner2;
}

contract NestedOptionalStructs {
    nested: Inner3;

    init() {
        self.nested = Inner3{
            c: Inner2{
                b: Inner1{a: null}
            }
        };
    }
}
