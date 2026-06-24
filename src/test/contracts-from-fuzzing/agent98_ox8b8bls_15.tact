struct Mid {
    q: Int;
    r: Bool;
}

contract DefaultValues {
    a: Int = 5;
    b: Bool = true;
    c: String = "xyz";
    d: Mid = Mid{ q:1, r:true };

    init() {
        self.a = 42;
        self.b = false;
        self.c = "abc";
        self.d = Mid{ q:7, r:false };
    }
}