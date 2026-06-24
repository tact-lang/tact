struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: String?;
    o6: String?;
}

contract ManyOptionalsContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null,
            o2: null,
            o3: true,
            o4: null,
            o5: "abc",
            o6: null
        };
    }
}