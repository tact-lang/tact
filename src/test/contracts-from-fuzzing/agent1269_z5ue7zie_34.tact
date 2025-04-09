// optional field with default set to false inside optional
struct OptBoolDefault {
    b: Bool? = false;
}

contract TestContract {
    f: OptBoolDefault;

    init() {
        self.f = OptBoolDefault{};
    }
}