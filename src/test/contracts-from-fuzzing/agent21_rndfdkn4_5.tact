struct Defaults {
    i: Int = 42;
    b: Bool = true;
    s: String = "hello";
    a: Address;
}

contract DefaultsTest {
    data: Defaults;

    init() {
        self.data = Defaults{
            a: myAddress(),
        };
    }
}
