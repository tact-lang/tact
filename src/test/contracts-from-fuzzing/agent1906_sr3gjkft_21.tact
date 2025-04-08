// This contract has a struct with lots of optional and normal fields together
struct Combo {
    oa: Int?;
    ob: Bool?;
    os: String?;
    a: Int;
    b: Bool;
    s: String;
}

contract ComboTest {
    comboVal: Combo;

    init() {
        self.comboVal = Combo{
            oa: null,
            ob: true,
            os: "hello",
            a: 17,
            b: false,
            s: "bye",
        };
    }
}
