struct OptNested {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    state: OptNested;

    init() {
        self.state = OptNested{innerOpt: InnerStruct{val: 5, flag: true}};
    }
}