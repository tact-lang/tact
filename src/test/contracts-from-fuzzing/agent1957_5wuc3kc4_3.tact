struct NestedLevel2 {
    z: Int;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    optInner: NestedLevel2?;
}

contract DeeplyNestedFields {
    state: NestedLevel1;

    init() {
        self.state = NestedLevel1{
            inner: NestedLevel2{z: 5},
            optInner: null
        };
    }
}