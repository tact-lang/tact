struct Level2 {
    p: Int;
    q: Bool;
}

struct NestedOptional {
    inner: Level2?;
    label: String;
}

contract NestedOptTest {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            inner: null,
            label: "test"
        };
    }
}
