contract DefaultZero {
    i: Int = 0;
    s: String = "";
    iopt: Int?;
    sopt: String?;

    init() {
        self.iopt = null;
        self.sopt = null;
    }
}
