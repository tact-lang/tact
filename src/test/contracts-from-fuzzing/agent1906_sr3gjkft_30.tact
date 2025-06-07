// Defaulted optional nested deeply inside struct
struct DeepInner {
    s: String? = null;
}

struct Outer {
    inn: DeepInner;
}

contract DefOptDeep {
    val: Outer;

    init() {
        self.val = Outer{ inn: DeepInner{} };
    }
}
