struct Params {
    flag: Bool?;
    amount: Int;
    note: String?;
}

contract OverrideStruct {
    params: Params = Params{flag:null, amount:0, note:null};

    init() {
        self.params = Params{
            flag: true,
            amount: 100,
            note: "Hello"
        };
    }
}