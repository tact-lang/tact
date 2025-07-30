struct N1 {
    a: Int?;
}

struct N2 {
    b: N1?;
}

struct N3 {
    c: N2?;
}

contract DeepNullable {
    storage: N3;

    init() {
        self.storage = N3{
            c: null
        };
    }
}