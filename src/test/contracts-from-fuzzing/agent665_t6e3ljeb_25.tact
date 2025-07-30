struct ManyOptionals {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
}

contract TestManyOpts {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
    }
}
