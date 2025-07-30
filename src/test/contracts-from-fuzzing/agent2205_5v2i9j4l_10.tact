struct InnerStruct {
    data: Int?;
}

contract OptionalStructStorage {
    opt: InnerStruct?;

    init() {
        self.opt = null;
    }
}