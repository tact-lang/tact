// optional inline struct default
struct Inline {
    a: Int;
}

struct Cont {
    opt: Inline? = null;
    val: Int = 42;
}

contract TestContract {
    data: Cont;

    init() {
        self.data = Cont{};
    }
}