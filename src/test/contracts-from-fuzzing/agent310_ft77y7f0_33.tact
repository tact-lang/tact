struct Sub {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    s1: Sub?;
    s2: Sub?;
    s3: Sub?;
    d: Int?;
    e: String?;
}

contract TestContract {
    c: Container?;

    init() {
        self.c = null;
    }
}
