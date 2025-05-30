contract OnlyOptionalDefaults {
    some: Int? = null;
    flag: Bool? = null;
    addr: Address? = null;
    txt: String? = null;

    init() {
        self.some = null;
        self.flag = null;
        self.addr = null;
        self.txt = null;
    }
}