struct OptionalNested {
    inner: Inner?;
    note: String;
}

struct Inner {
    value: Int;
    label: String;
}

contract OptionalTest {
    item: OptionalNested;
    
    init() {
        self.item = OptionalNested{
            inner: null,
            note: "empty"
        };
    }
}