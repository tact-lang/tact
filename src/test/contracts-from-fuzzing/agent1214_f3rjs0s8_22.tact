struct SOpt {
    inner: Int?;
}

struct SDef {
    inner: Int = 5;
}

contract OptionalVsDefault {
    so: SOpt;
    sd: SDef;
    init() {
        self.so = SOpt{ inner: null };
        self.sd = SDef{};
    }
}