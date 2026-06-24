struct Simple1 {
    v: Int;
}

struct Simple2 {
    v: Int?;
}

struct Simple3 {
    v: Bool?;
}

contract TestContract {
    s1: Simple1?;
    s2: Simple2?;
    s3: Simple3?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}