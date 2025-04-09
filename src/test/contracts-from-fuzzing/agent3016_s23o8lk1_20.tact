struct ManyOptional {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: String?;
}

contract TestContract {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null
        };
    }
}