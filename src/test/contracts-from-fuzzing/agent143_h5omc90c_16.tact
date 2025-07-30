struct LargeOptional {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: Bool?;
    o6: Bool?;
    o7: Int?;
    o8: Bool?;
}

contract TestContract {
    optObj: LargeOptional;

    init() {
        self.optObj = LargeOptional{
            o1:null, o2:null, o3:null, o4:null, o5:null, o6:null, o7:null, o8:null
        };
    }
}