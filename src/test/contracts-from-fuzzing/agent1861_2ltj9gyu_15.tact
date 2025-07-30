struct LargeOptionalStruct {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
    o8: Int?;
    o9: Int?;
    o10: Int?;
    o11: String?;
    o12: String?;
    o13: String?;
    o14: String?;
    o15: String?;
}

contract LargeOptionalContract {
    data: LargeOptionalStruct;

    init() {
        self.data = LargeOptionalStruct{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
            o7: null,
            o8: null,
            o9: null,
            o10: null,
            o11: null,
            o12: null,
            o13: null,
            o14: null,
            o15: null,
        };
    }
}