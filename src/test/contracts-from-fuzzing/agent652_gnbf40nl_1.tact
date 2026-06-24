struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: AnotherStruct?;
}

struct AnotherStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: true,
            c: AnotherStruct{
                x: 1,
                y: false,
            }
        };
    }
}