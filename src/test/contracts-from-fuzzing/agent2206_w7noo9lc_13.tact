struct SDefault {
    a: Int = 42;
    b: Bool?;
    c: String = "hi";
}

struct Wrapper {
    v1: SDefault;
    v2: SDefault;
}

contract Test13 {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            v1: SDefault{},
            v2: SDefault{}
        };
    }
}
