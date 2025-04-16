struct OptionStringBool {
    s: String?;
    b: Bool?;
}

struct OptionInt {
    i: Int?;
}

contract MultiOptionalStructs {
    a: OptionStringBool;
    b: OptionInt;

    init() {
        self.a = OptionStringBool{ s:null, b:null };
        self.b = OptionInt{ i:null };
    }

    receive() {
        let a = self.a;
        let b = self.b;
    }
}