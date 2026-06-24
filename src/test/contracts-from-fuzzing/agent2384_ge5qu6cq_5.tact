struct Defaults {
    val: Int = 5;
    valOpt: Int?;
    flag: Bool = true;
}

contract DefaultsTest {
    data: Defaults;

    init() {
        self.data = Defaults{valOpt: null};
    }
}