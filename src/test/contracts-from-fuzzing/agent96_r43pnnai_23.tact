struct ManyOptions {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: Bool?; o7: Bool?; o8: Bool?; o9: Bool?; o10: Bool?;
}

contract ManyOptionsContract {
    opts: ManyOptions;

    init() {
        self.opts = ManyOptions{
            o1: null, o2: null, o3: null, o4: null, o5: null,
            o6: null, o7: null, o8: null, o9: null, o10: null
        };
    }
}