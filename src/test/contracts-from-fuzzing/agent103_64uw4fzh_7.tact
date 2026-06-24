struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?;
}

struct Inner {
    flag: Bool;
    num: Int?;
}

contract TestContract {
    x: DeepOptionals;

    init() {
        self.x = DeepOptionals{ a:null, b:null, c:null, d:null };
    }
}
