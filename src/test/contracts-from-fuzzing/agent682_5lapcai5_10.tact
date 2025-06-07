struct OptFieldDefaults {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;
}

contract TestContract {
    o: OptFieldDefaults;

    init() {
        self.o = OptFieldDefaults{};
    }
}