struct InnerStr {
    msg: String;
}

contract StringInStruct {
    store: InnerStr;

    init() {
        self.store = InnerStr{
            msg: "hello blockchain"
        };
    }
}