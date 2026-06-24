struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
    o5: String?;
}

contract ManyOptionalsTest {
    d: ManyOptionals;

    init() {
        self.d = ManyOptionals{
            o1: null,
            o2: 123,
            o3: "abc",
            o4: null,
            o5: null,
        };
    }
}
