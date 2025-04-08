// struct with optional and default filled optional
struct OptDefault {
    a: Int? = null;
    b: Bool? = true;
}

contract OptDefaultsContract {
    x: OptDefault;

    init() {
        self.x = OptDefault{};
    }
}
