struct OptionalNested {
    foo: Int?;
    bar: String?;
}

contract OptNestedStore {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}