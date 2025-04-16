struct Combo {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    p: String?;
}

contract ComboTest {
    field: Combo;

    init() {
        self.field = Combo{
            i: 10,
            b: false,
            s: "test",
            o: null,
            p: null
        };
    }
}