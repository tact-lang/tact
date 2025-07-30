struct OptLevel2 {
    innerOpt: Int?;
}

struct OptLevel1 {
    inner: OptLevel2?;
}

contract NestedOptionals {
    a: OptLevel1;

    init() {
        self.a = OptLevel1{ inner: null };
    }
}