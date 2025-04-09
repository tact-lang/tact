struct SOption {
    number: Int?;
    flag: Bool?;
}

contract OptionalFields {
    f: SOption;
    init() {
        self.f = SOption{number:null, flag:true};
    }
}