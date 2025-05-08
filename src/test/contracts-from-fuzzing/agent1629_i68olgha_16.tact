contract DefaultContractFields {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "done";
        self.d = null;
        self.e = null;
    }
}