struct CompatTest {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract FieldCompat {
    c: CompatTest;

    init() {
        self.c = CompatTest{
            i: 1,
            b: true,
            s: "test",
            o: null
        };
    }
}