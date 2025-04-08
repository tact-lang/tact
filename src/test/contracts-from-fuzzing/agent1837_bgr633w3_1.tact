struct SingleFieldNested {
    inner: OptionalNested;
}

struct OptionalNested {
    value: Int?; // Optional primitive
}

contract NestedContract {
    data: SingleFieldNested;

    init() {
        self.data = SingleFieldNested{
            inner: OptionalNested{ value: 10 }
        };
    }
}