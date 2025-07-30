struct NilAll {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    zero: NilAll;

    init() {
        self.zero = NilAll{};
    }
}