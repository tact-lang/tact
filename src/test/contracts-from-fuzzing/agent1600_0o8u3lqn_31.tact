struct NestedRem {
    important: Int;
    rem: Slice as remaining;
}

struct Container {
    id: Int;
    payload: NestedRem?;
}

contract NestedRemainingOptTest {
    data: Container;

    init() {
        self.data = Container{
            id: 1,
            payload: null
        };
    }
}