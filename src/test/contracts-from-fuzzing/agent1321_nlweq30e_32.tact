// Contract with large persistent struct with many optionals defaulting to null
struct ManyOpts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
    o7: Builder?;
}

contract OptDefaults {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{ o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null };
    }
}
