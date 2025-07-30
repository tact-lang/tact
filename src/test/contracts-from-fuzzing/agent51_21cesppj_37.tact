struct ABool {
    flag: Bool;
}
struct AIntOpt {
    num: Int?;
}

contract DiffTypes {
    a: ABool;
    b: AIntOpt;

    init() {
        self.a = ABool{ flag: true };
        self.b = AIntOpt{ num: null };
    }
}