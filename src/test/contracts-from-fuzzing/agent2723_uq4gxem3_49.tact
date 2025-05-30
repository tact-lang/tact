struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract WrapOptions {
    o: Optionals;
    init() {
        self.o = Optionals{ a:null, b:true, c:null, d:null };
    }
}