// large struct many optionals defaulting null
struct ManyOpts {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
    o7: String?;
}

contract Test {
    stuff: ManyOpts;

    init() {
        self.stuff = ManyOpts{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null
        };
    }
}