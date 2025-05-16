struct ManyOpt {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
}

contract Test {
    data: ManyOpt;

    init() {
        self.data = ManyOpt{
            o1: null,
            o2: true,
            o3: null,
            o4: 5,
            o5: false,
        };
    }
}