struct ManyOpts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Address?;
}

contract OptionalFields {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{ o1:null, o2:null, o3:null, o4:null, o5:null };
    }
}