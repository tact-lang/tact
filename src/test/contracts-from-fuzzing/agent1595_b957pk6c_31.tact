// nested struct with deepest string optional
struct L0 { s: String?; }
struct L1 { l: L0; }

contract TestContract {
    val: L1;

    init() {
        self.val = L1{ l: L0{ s: null } };
    }
}