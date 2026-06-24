struct Child { val: Int }

struct Parent {
    inner: Child?;
    flag: Bool;
}

contract TestOptionalNested {
    store: Parent;
    init() {
        self.store = Parent{
            inner: null,
            flag: true
        };
    }
}