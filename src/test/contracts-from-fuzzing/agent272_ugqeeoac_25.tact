// Testing optional field inside message used as persistent variable
message(22) MsgOpt {
    v: Int?;
}

contract MsgOptPersist {
    m: MsgOpt;

    init() {
        self.m = MsgOpt{ v:null };
    }
}