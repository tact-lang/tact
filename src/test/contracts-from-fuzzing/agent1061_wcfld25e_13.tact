// many fields of optional nested struct types
struct Info { score: Int; comment: String; }

struct Wrapper {
    details: Info?;
    label: String;
}

contract Test {
    w1: Wrapper;
    w2: Wrapper;
    w3: Wrapper;

    init() {
        self.w1 = Wrapper{ details: null, label: "1" };
        self.w2 = Wrapper{ details: Info{ score: 10, comment: "ok" }, label: "2" };
        self.w3 = Wrapper{ details: null, label: "3" };
    }
}