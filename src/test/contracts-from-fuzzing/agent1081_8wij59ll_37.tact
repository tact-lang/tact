struct SOption {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructOnContract {
    f: SOption?;

    init() {
        self.f = SOption{a:null,b:null,c:null};
    }
}