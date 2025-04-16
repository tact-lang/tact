struct OptStrStruct {
    s: String?;
    flag: Bool;
}

contract NestedStrOpt {
    d: OptStrStruct;

    init() {
        self.d = OptStrStruct{
            s: null,
            flag: false,
        };
    }
}
