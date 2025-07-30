// struct with optional and defaulted nested struct
struct Leaf {
    v: Int = 0;
}

struct Branch {
    l: Leaf? = null;
    b: Bool = true;
}

contract TestContract {
    val: Branch;

    init() {
        self.val = Branch{};
    }
}