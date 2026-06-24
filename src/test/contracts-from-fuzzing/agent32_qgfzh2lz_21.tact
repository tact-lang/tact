struct ManyOptionals {
    o1: Int?; o2: Bool?; o3: Address?; o4: String?;
    o5: Cell?; o6: Int?; o7: Bool?; o8: Address?;
    o9: String?; o10: Cell?;
}

contract BigOptionalState {
    opts: ManyOptionals;
    init() {
        self.opts = ManyOptionals{
            o1:null, o2:null, o3:null, o4:null, o5:null,
            o6:null, o7:null, o8:null, o9:null, o10:null
        };
    }
}
