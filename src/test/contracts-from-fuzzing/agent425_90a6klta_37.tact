// Optionals defaulted to null, structural defaults omitted explicitly in instantiation
struct S {
    a: Int?;
    b: Int? = null;
    c: Bool? = null;
    d: Int = 1;
    e: Bool = false;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{ a:null };
    }
}