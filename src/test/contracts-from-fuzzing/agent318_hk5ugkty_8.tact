struct DefaultOuter {
    val: Int = 5;
    valOpt: Int?;
}

contract DefaultsTest {
    f: DefaultOuter;

    init() {
        self.f = DefaultOuter{};
    }
}