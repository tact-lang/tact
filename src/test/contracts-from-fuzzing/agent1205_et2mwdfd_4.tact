struct OptionalNest {
    sub: SubStruct?;
}

struct SubStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{sub: null};
    }
}