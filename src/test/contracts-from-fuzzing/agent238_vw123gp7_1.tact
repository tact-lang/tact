struct NestedOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract TestStorage {
    myStruct: NestedOpt;

    init() {
        self.myStruct = NestedOpt{
            a: null,
            b: null,
            c: null,
        };
    }
}