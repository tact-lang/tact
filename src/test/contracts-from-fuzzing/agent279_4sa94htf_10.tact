struct NestedOptionalInside {
    value: Int?;
    label: String?;
}

struct Container {
    inner: NestedOptionalInside?;
    status: Bool;
}

contract NestedNullableStructs {
    containerField: Container;

    init() {
        self.containerField = Container{
            inner: null,
            status: true
        };
    }
}