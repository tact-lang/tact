struct LargeOptional {
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
}

contract LargeOptContract {
    data: LargeOptional;

    init() {
        self.data = LargeOptional{
            o1: 1,
            o2: null,
            o3: 3,
            o4: null,
            o5: 5,
            o6: null,
            o7: 7,
            o8: null,
            o9: 9,
            o10: null
        };
    }
}