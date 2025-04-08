struct Inner1 { a: Int }
struct Inner2 { b: Int }
struct Composed {
    fst: Inner1;
    snd: Inner2;
}

contract DoubleNestedStructs {
    field: Composed;

    init() {
        self.field = Composed{
            fst: Inner1{ a: 42 },
            snd: Inner2{ b: 24 }
        };
    }
}