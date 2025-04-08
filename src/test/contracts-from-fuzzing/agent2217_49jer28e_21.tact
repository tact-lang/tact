struct ChildOpts {
    a: Int?;
    b: String?;
}

struct Holder {
    h1: ChildOpts?;
    h2: ChildOpts?;
}

contract OptStructs {
    big: Holder;

    init() {
        self.big = Holder{
            h1: null,
            h2: ChildOpts{a:null,b:null}
        };
    }
}
