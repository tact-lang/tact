struct ManyDefaults {
    a: Int=1;
    b: Bool=true;
    c: String="hi";
    d: Int=5;
    e: String="bye";
}

contract ManyDefaultsContract {
    m: ManyDefaults;
    init() {
        self.m = ManyDefaults{};
    }
}