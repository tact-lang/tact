struct StructWithOption {
    info: String?;
    flag: Bool?;
}

contract UseOptStruct {
    data: StructWithOption;

    init() {
        self.data = StructWithOption{
            info: null,
            flag: null,
        };
    }
}