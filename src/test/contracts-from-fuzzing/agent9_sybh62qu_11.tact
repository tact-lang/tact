struct S1 { innerVal: Int }
struct S2 { inner: S1 }
struct S3 { deeper: S2 }
struct S4 { deepest: S3 }

contract FlatDeepCombo {
    val: Int;
    flag: Bool;
    rec: S4;
    txt: String;

    init() {
        self.val = 42;
        self.flag = true;
        self.rec = S4{ deepest: S3{ deeper: S2{ inner: S1{ innerVal: 7 } } } };
        self.txt = "combo";
    }
}