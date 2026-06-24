struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: Bool?;
    o6: String?;
    o7: Address?;
    o8: Cell?;
    o9: Slice?;
    o10: Builder?;
}

contract OptsMany {
    field: ManyOptionals;
    init() {
        self.field = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,o5:null,
            o6:null,o7:null,o8:null,o9:null,o10:null
        };
    }
}
