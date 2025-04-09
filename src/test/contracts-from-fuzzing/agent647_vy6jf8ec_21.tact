struct Data {
    v: Int?;
}

contract InitNullOpt {
    d: Data;

    init() {
        self.d = Data{ v:null };
    }
}