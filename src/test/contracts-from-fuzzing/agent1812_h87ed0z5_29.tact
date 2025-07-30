struct MultiDefaults {
    a: Int = 1;
    b: Bool? = null;
    c: String = "x";
    d: Int?;
}

contract MultiDefaultsContract {
    data: MultiDefaults;

    init() {
        self.data = MultiDefaults{
            d: null
        };
    }
}