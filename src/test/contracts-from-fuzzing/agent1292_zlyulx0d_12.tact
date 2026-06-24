struct MultiDefaults {
    x: Int = 1;
    y: Int = 2;
    flag: Bool = true;
    desc: String = "desc";
    optS: String?;
}

contract ComplexDefaults {
    m: MultiDefaults;

    init() {
        self.m = MultiDefaults{ optS: null };
    }
}