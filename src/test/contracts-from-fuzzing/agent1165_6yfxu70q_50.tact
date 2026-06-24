struct RecvStruct {
    flag: Bool;
}

contract FieldAndDefaultOpt {
    a: Int?;
    both: RecvStruct?;

    init() {
        self.a = null;
        self.both = null;
    }
}
