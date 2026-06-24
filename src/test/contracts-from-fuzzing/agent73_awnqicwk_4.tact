struct ManyOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalsTest {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals {
            i: null,
            b: true,
            s: null
        };
    }
}