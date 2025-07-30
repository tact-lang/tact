struct NestedStringsOptionals {
    a: String?;
    b: Nested2?;
}

struct Nested2 {
    c: String?;
    d: Nested3?;
}

struct Nested3 {
    e: String?;
}

contract TestContract {
    data: NestedStringsOptionals;

    init() {
        self.data = NestedStringsOptionals{
            a: null,
            b: Nested2{
                c: "hi",
                d: Nested3{e: null}
            }
        };
    }
}
