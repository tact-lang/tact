// test optional struct used directly as top-level persistent var
struct SimpleStruct {
    foo: Int;
}

contract TestContract {
    ss: SimpleStruct?;

    init() {
        self.ss = SimpleStruct{ foo: 777 };
    }
}