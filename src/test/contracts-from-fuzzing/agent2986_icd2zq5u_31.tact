// test struct default string and int values
struct Defaults {
    s: String = "";
    i: Int = 0;
}

contract StructDefaultsTest {
    f: Defaults;

    init() {
        self.f = Defaults{};
    }
}