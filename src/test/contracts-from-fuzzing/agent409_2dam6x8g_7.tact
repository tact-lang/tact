struct Options {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptContract {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Options?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}