struct AllOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionalsPresent {
    data: AllOpt;

    init() {
        self.data = AllOpt{
            a: 1,
            b: true,
            c: "filled"
        };
    }
}