struct HasOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract WithOptStruct {
    data: HasOpt;

    init() {
        self.data = HasOpt{
            a: null,
            b: null,
            c: null,
        };
    }
}
