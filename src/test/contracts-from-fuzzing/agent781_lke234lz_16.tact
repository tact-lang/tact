struct ABool {
    x: Bool = true;
}

struct BInt {
    y: Int = 123;
}

struct CString {
    z: String = "hi";
}

contract ManyTypesNested {
    a: ABool;
    b: BInt;
    c: CString;

    init() {
        self.a = ABool{ x:false };
        self.b = BInt{ y:456 };
        self.c = CString{ z:"bye" };
    }
}