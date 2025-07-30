struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;
    o5: Bool?;
    o6: Int?;
}

contract OptionRain {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            o1: null,
            o2: null,
            o3: true,
            o4: null,
            o5: false,
            o6: 777,
        };
    }
}