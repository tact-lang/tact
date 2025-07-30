struct Embed {
    v: Int;
}

struct TopOpt {
    inner: Embed?;
}

contract OptStructInStruct {
    reference: TopOpt?;

    init() {
        self.reference = TopOpt{ inner: null };
    }
}