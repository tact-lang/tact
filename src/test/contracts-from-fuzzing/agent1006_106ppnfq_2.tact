struct NestedLevel2 {
    z: String;
    b: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    optionalInner: NestedLevel2?;
}

contract TestContract {
    storage: NestedLevel1;

    init() {
        self.storage = NestedLevel1{
            inner: NestedLevel2{ z: "bar", b: true },
            optionalInner: null
        };
    }
}
