contract OptionalDefaultsExtra {
    a: Int?=null;
    b: Int?=null;

    init() {
        self.a=5;
        self.b=null;
    }
}