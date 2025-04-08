struct Combo {
    i: Int;
    o: Int?;
    b: Bool;
    bo: Bool?;
}

contract ComboTest {
    data: Combo;

    init() {
        self.data = Combo{
            i: 10,
            o: null,
            b: true,
            bo: null
        };
    }
}
