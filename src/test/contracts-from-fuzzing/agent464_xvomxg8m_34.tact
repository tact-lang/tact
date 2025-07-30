struct StructWithManyOpt {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
}

contract WithManyOptStruct {
    nested: StructWithManyOpt;

    init() {
        self.nested = StructWithManyOpt{
            o1:null, o2:null, o3:null, o4:null, o5:null
        };
    }
}
