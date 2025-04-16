// struct with large number of optionals
struct Options10 {
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

contract StructLargeOptionals {
    data: Options10;

    init() {
        self.data = Options10{
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
        };
    }
}