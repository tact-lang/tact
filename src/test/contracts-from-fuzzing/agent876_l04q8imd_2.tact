struct NestedLevel3 {
    b: Bool;
}

struct NestedLevel2 {
    inner: NestedLevel3;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

contract DeepStructs {
    state: NestedLevel1;

    init() {
        self.state = NestedLevel1{
            inner: NestedLevel2{
                inner: NestedLevel3{
                    b: true
                }
            }
        };
    }

    receive() {
        dump(self.state.inner.inner.b);
    }
}