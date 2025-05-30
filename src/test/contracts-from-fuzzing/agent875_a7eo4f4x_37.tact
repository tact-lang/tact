struct IntDefaults {
    a: Int=0;
    b: Int=1;
    c: Int=2;
}

contract IntDefaultsContract {
    i: IntDefaults;
    init() {
        self.i = IntDefaults{};
    }
}