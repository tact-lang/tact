struct Wrapper {
    sval: String;
    aval: Address;
}

struct Holds {
    first: Wrapper;
    second: Wrapper;
}

contract DoubleNestedStruct {
    content: Holds;

    init() {
        self.content = Holds{
            first: Wrapper{ sval:"one", aval: myAddress() },
            second: Wrapper{ sval:"two", aval: myAddress() },
        };
    }
}
