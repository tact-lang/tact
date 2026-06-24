struct Combo {
    x: Int as uint8;
    y: Int?;
    z: Bool;
    w: Bool?;
    s: String;
    r: String?;
}

contract ComboTest {
    val: Combo = Combo{ x:1, y:null, z:false, w:null, s:"a", r:null };

    init() {
        self.val = Combo{ x:2, y:3, z:true, w:false, s:"b", r:"c" };
    }
}
