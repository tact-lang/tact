const MAGIC: Int = 777;

struct ConstDep {
    x: Int = MAGIC;
    y: String = "hi";
}

contract TestContract {
    val: ConstDep;

    init() {
        self.val = ConstDep{};
    }
}
