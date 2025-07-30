// Optional composite struct
struct Sub {
    val: Int;
}

contract TestContract {
    sub: Sub?;
    init() {
        self.sub = null;
    }
}