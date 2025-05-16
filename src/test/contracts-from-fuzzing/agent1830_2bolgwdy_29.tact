struct LargeOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Address?;
    o6: Slice?;
    o7: Int?;
    o8: Bool?;
    o9: String?;
    o10: Cell?;
}

contract TestContract {
    data: LargeOptionals;

    init() {
        self.data = LargeOptionals{
            o1:null, o2:null, o3:null, o4:null, o5:null,
            o6:null, o7:null, o8:null, o9:null, o10:null
        };
    }
}
