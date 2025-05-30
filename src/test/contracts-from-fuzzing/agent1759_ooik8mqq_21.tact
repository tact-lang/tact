struct Payload {
    memo: String;
    amount: Int;
    flag: Bool;
}

contract MixedStruct {
    data: Payload;

    init() {
        self.data = Payload{ memo:"yo", amount:1000, flag:true };
    }
}
