struct InnerA {
    foo: Bool;
}

struct InnerB {
    bar: InnerA;
}

contract TestContract {
    optStruct: InnerB?;

    init() {
        self.optStruct = InnerB{ bar: InnerA{ foo: true } };
    }
}