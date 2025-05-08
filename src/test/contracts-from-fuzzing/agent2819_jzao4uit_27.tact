// struct with mix of default, optional, and explicit assignment
struct Combo {
    a: Int = 1;
    b: Int?;
    c: Bool? = null;
    d: String = "hi";
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            b: null
        };
    }
}