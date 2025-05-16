struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    multiOpt: MultipleOptionals;

    init() {
        self.multiOpt = MultipleOptionals{ a: null, b: null, c: null };
    }
}