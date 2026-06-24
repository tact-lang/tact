struct WithBoolDefault {
    x: Bool = true;
    y: Bool = false;
}

contract DefaultBoolTest {
    f: WithBoolDefault;

    init() {
        self.f = WithBoolDefault{};
    }
}