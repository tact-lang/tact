// Struct in contract, wrapped in optional
struct Tiny {
    v: Int = 11;
}

contract OptWrap {
    field: Tiny? = null;
    init() {
        self.field = Tiny{};
    }
}