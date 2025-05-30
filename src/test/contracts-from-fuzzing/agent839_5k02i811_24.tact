struct ManySlots {
    a: Int;
    b: Int?;
    c: Bool;
    d: Address;
    e: String?;
    f: Int?;
}

contract SlotsTest {
    slot: ManySlots;
    optSlot: ManySlots?;
    init() {
        self.slot = ManySlots{a:1,b:null,c:true,d:myAddress(), e:null, f:null};
        self.optSlot = null;
    }
}