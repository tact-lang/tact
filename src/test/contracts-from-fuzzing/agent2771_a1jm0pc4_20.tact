struct TinyDefaults {
    a: Int as uint4 = 7;
    b: Int as int3 = -3;
}

contract TinyDefaultsContract {
    data: TinyDefaults;

    init() {
        self.data = TinyDefaults{};
    }
}