struct MultipleNestedOptionals {
    a: Int?;
    b: OptionalNested?;
}

struct OptionalNested {
    c: Int?;
    d: String?;
}

contract TestContract {
    data: MultipleNestedOptionals;

    init() {
        self.data = MultipleNestedOptionals{
            a: null,
            b: OptionalNested{ c: null, d: null }
        };
    }
}