struct OptionalWithStruct {
    s: SimpleStruct?;
}

struct SimpleStruct {
    foo: Int;
}

contract TestContract {
    opt: OptionalWithStruct;

    init() {
        self.opt = OptionalWithStruct{ s: SimpleStruct{ foo: 99 } };
    }
}