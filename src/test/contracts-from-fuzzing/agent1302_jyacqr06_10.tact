struct FieldsWithDefaults {
    n: Int = 101;
    m: Bool = true;
    t: String = "abc";
    x: Int?; // should default to null
}

contract DefaultsTest {
    val: FieldsWithDefaults;

    init() {
        self.val = FieldsWithDefaults{
            n: 55, m: false, t: "zzz", x: null
        };
    }

    receive() {
        let n = self.val.n;
        let m = self.val.m;
        let t = self.val.t;
        let x = self.val.x;
    }
}
