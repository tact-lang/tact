struct NestedTest {
    x: Int;
    y: Bool?;
    z: String;
    w: Address?;
    q: Slice?;
    r: Cell?;
    s: String?;
}

contract UseNested {
    field: NestedTest = NestedTest{
        x: 42,
        y: true,
        z: "hello",
        w: null,
        q: null,
        r: null,
        s: null,
    };

    init() {
        self.field = self.field;
    }
}