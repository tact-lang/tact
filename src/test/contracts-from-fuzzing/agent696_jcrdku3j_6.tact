struct OptionalNestedLevel2 {
    foo: Int?;
    bar: Bool?;
}

struct OptionalNestedLevel1 {
    nested: OptionalNestedLevel2?;
    flag: Bool;
}

contract TestContract {
    data: OptionalNestedLevel1;

    init() {
        self.data = OptionalNestedLevel1{
            nested: null,
            flag: false
        };
    }
}