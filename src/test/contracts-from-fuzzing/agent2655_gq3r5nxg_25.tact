struct Chain3 {
    a: Int;
}

struct Chain2 {
    c3: Chain3?;
}

struct Chain1 {
    c2: Chain2?;
}

contract LinkedNullable {
    root: Chain1?;

    init() {
        self.root = null;
    }
}