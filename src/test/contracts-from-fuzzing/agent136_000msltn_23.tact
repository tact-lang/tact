struct SmallS {
    f: Int;
}

contract OptionalStruct {
    data: SmallS?;

    init() {
        self.data = null;
    }
}