struct OptStruct {
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            innerOpt: null
        };
    }
}