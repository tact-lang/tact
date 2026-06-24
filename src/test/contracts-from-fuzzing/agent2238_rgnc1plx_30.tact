struct Compose {
    a: Int as uint32;
    b: Bool;
    c: String?;
}

contract TestContract {
    c: Compose;

    init() {
        self.c = Compose{
            a: 42,
            b: true,
            c: null,
        };
    }
}
