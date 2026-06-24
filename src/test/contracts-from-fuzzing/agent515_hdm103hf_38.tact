// Wide optional composite nesting
struct Innermost {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Midlevel {
    a: Innermost?;
    b: Innermost?;
}

contract WideOptNest {
    m1: Midlevel?;
    m2: Midlevel?;

    init() {
        self.m1 = null;
        self.m2 = Midlevel{ a:null, b:null };
    }
}
