struct Nullable {
    num: Int?;
    flag: Bool?;
    message: String?;
}

contract OptFields {
    f: Nullable;

    init() {
        self.f = Nullable{
            num:null,
            flag:null,
            message:null
        };
    }
}
