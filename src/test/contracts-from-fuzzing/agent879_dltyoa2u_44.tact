struct ComboOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract ComboOptionalsTest {
    s: ComboOptionals;
    init() {
        self.s = ComboOptionals{};
    }
}
