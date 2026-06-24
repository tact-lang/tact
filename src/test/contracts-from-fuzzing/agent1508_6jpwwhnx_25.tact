struct DeepOpt {
    inner: Inner?;
}

struct Inner {
    val: Int = 42;
    flag: Bool? = null;
}

contract TestContract {
    pdb: DeepOpt;

    init() {
        self.pdb = DeepOpt{inner: null};
    }
}