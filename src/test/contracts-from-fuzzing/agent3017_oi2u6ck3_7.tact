struct ManyOptions {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Address?;
    o5: Cell?;
    o6: String?;
    o7: Slice?;
    o8: Builder?;
    o9: Int?;
    o10: Bool?;
}

contract Test {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            o1:null, o2:null, o3:null, o4:null, o5:null, o6:null, o7:null, o8:null, o9:null, o10:null
        };
    }
}