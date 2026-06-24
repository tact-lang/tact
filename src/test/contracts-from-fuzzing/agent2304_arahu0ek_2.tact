struct SOpt {
    si: Int?;
    sb: Bool?;
    ss: String;
}

contract WithOptionalStruct {
    data: SOpt;

    init() {
        self.data = SOpt{
            si: null,
            sb: null,
            ss: "hello"
        };
    }
}