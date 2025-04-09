struct Defaults {
    x: Int = 5;
    y: String = "abc";
    z: Bool = true;
}

contract DefaultsTest {
    f: Defaults;

    init() {
        self.f = Defaults{
            x: 10,
            y: "zzz",
            z: false
        };
    }
}
