message Msg0 {}
message Msg1 { val: Int; }
message Msg2 { flag: Bool; }

struct HasMessages {
    m0: Msg0;
    m1: Msg1;
    m2: Msg2;
}

contract Test16 {
    hm: HasMessages;

    init() {
        self.hm = HasMessages{
            m0: Msg0{},
            m1: Msg1{val:1},
            m2: Msg2{flag:true},
        };
    }
}