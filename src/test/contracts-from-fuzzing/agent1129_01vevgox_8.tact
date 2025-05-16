struct Mid {
    f1: Int?;
    f2: Int;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract DuplicateStructs {
    store: Top;

    init() {
        self.store = Top{
            m1: Mid{f1:null, f2:10},
            m2: Mid{f1:1, f2:20},
        };
    }
}
