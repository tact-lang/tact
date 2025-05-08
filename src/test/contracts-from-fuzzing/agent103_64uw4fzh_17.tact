struct S1 {
    a: Int?;
    b: Inner?;
}

struct Inner {
    flag: Bool?;
    num: Int?;
    text: String?;
}

contract TestContract {
    s: S1;

    init() {
        self.s = S1{ a:null, b:null };
    }
}
