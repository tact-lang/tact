// deeply nested optional structs initialized explicit nulls
struct L1 { a: Int? }
struct L2 { s: L1? }
struct L3 { t: L2? }

contract TestContract {
    s: L3;

    init() {
        self.s = L3 {
            t: null,
        };
    }
}