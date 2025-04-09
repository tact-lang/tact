struct OptionalStruct {
    val: Int;
    flag: Bool;
}

struct Container {
    innerOpt: OptionalStruct?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            innerOpt: OptionalStruct{ val: 7, flag: false },
        };
    }
}