struct SDeep {
    inn: Int?;
}

contract OptAssignReplace {
    s: SDeep?;

    init() {
        self.s = null;
        self.s = SDeep{inn: 1};
        self.s = null;
    }
}