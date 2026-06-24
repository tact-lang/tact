// Struct with optional, defaulted optional, nested struct with optional and defaulted
struct Leaf { val: Int? = null; }
struct Base {
    a: Int?; // no default
    b: Int? = null;
    c: Leaf = Leaf{};
}

contract DefaultAndOptional {
    val: Base;

    init() {
        self.val = Base{
            a:null,
            b:null,
            c: Leaf{}
        };
    }
}
