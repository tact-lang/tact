struct L3 { c: Int?; }
struct L2 { b: L3?; }
struct L1 { a: L2?; }

contract ImplicitNullDeepOpt {
    data: L1;

    init() {
        self.data = L1{};
    }

    receive() {}
}