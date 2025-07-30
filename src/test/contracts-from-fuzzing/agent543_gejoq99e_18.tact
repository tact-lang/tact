struct MultiDefaultOpt {
    a: Int?;
    b: Int = 5;
    c: Int? = null;
}

contract MultiDefaultOptStore {
    d: MultiDefaultOpt;

    init() {
        self.d = MultiDefaultOpt{ a:null };
    }
}
