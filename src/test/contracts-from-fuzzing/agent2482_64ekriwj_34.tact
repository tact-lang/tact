contract WithConsts {
    const c1: Int = 5;
    a: Int;

    init() {
        self.a = self.c1;
    }
}