struct SomeStruct {
    p: Int;
    q: Int;
}

contract PartialAssign {
    data: SomeStruct;

    init() {
        self.data = SomeStruct{ p: 5, q: 10 };
        self.data.p = 20;
    }
}