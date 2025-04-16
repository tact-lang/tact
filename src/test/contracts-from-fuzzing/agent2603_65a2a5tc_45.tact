struct First { a: Int }
struct Second { b: String }

struct Combo {
    f: First;
    s: Second;
}

contract DiffStructsNested {
    val: Combo;
    init() {
        self.val = Combo{
            f: First{a:1},
            s: Second{b:"b"}
        };
    }
}
