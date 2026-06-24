// embedded optional strings
struct StringsOpt {
    a: String?;
    b: String?;
    c: String?;
}
contract OptStrs {
    s: StringsOpt;
    init() {
        self.s = StringsOpt{ a:null, b:null, c:null };
    }
}