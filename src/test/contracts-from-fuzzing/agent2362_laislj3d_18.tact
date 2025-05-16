struct LargeOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: String?;
    o6: Int?;
    o7: Bool?;
    o8: String?;
}

contract LargeOptionalContract {
    d: LargeOptionals;

    init() {
        self.d = LargeOptionals{
            o1:null, o2:null, o3:null, o4:null,
            o5:null, o6:null, o7:null, o8:null
        };
    }
}