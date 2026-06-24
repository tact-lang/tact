struct Rec1 {
    foo: Int;
}

struct Rec2 {
    bar: Rec1?;
}

struct Rec3 {
    baz: Rec2?;
}

contract OptionalNestTest {
    val: Rec3;

    init() {
        self.val = Rec3{
            baz: Rec2{
                bar: Rec1{foo:777}
            }
        };
    }
}