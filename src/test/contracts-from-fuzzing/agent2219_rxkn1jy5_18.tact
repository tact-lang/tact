struct OnlyOptionals { a: Int?; b: String?; c: Bool?; }

contract OnlyOpt {
    f: OnlyOptionals;

    init() {
        self.f = OnlyOptionals{ a:null, b:null, c:null };
    }
}