struct Data {
    x: Int;
    y: Bool;
    note: String;
    flag: Bool?;
    amount: Int?;
}

contract UseDefaults {
    data: Data;

    init() {
        self.data = Data{
            x:1,
            y:true,
            note:"abc",
            flag: null,
            amount: null,
        };
    }
}
