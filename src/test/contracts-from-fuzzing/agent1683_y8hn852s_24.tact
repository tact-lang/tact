struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract ComboTest {
    val: Combo;

    init() {
        self.val = Combo{
            a:1,
            b:null,
            c:true,
            d:null,
            e:"hi",
            f:null
        };
    }

    receive() {
        self.val = Combo{
            a:2,
            b:3,
            c:false,
            d:true,
            e:"bye",
            f:"yes"
        };
    }
}