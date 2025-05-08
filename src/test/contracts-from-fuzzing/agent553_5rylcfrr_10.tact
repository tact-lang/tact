struct NestedOpt {
    flag: Bool?;
    text: String?;
}

contract OptInStruct {
    info: NestedOpt;

    init() {
        self.info = NestedOpt{
            flag: null,
            text: null
        };
    }
}