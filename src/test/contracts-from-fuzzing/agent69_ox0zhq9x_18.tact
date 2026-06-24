contract ConstantsAndFields {
    const C1: Int = 5;
    const C2: String = "hello";
    c: Int;
    s: String;

    init() {
        self.c = self.C1;
        self.s = self.C2;
    }
}
