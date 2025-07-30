struct OnlyOptional {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptStructTest {
    data: OnlyOptional;

    init() {
        self.data = OnlyOptional{
            f1: null,
            f2: null,
            f3: null
        };
    }
}