struct SOpt {
    inner: Int?;
    flag: Bool?;
}

struct MultiSOpt {
    a: SOpt;
    b: SOpt;
}

contract Test12 {
    st: MultiSOpt;

    init() {
        self.st = MultiSOpt{
            a: SOpt{ inner: null, flag: null },
            b: SOpt{ inner: 123, flag: true }
        };
    }
}
