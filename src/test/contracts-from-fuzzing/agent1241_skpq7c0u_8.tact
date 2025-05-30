struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "ok";
}

contract DefTest {
    persist: Defaults;

    init() {
        self.persist = Defaults{};
    }
}
