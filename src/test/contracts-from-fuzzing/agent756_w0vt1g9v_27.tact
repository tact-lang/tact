contract StringsOptionals {
    a: String?;
    b: String = "b";
    c: String?;

    init() {
        self.a = null;
        self.c = null;
    }
}