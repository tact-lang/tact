// test default-initialized struct fields
struct Def {
    a: Int = 42;
    b: Bool = true;
}

contract Test {
    val: Def;
    init() {
        self.val = Def{};
    }
}