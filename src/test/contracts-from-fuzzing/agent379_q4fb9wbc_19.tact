struct Weird {
    a: Int?;
    b: Bool;
    c: String?;
}

contract OptionalNonOptionalMix {
    w: Weird;

    init() {
        self.w = Weird{ a:null, b:true, c:null };
    }
}