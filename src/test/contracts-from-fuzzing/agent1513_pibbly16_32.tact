struct T1 {
    a: Int?;
}

struct T2 {
    b: T1?;
}

contract OptOpt {
    c: T2?;

    init() {
        self.c = null;
    }
}