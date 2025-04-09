struct OptionalCont {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Cell?;
    o5: Slice?;
    o6: Address?;
}

contract LotsOfOptions {
    opt: OptionalCont;

    init() {
        self.opt = OptionalCont{
            o1:null,
            o2:null,
            o3:null,
            o4:null,
            o5:null,
            o6:null,
        };
    }
}