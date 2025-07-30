struct ManyOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract OptionalsTest {
    d: ManyOptionals;

    init() {
        self.d = ManyOptionals{ oi: null, ob: true, os: null };
    }
}
