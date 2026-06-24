struct InnerMost {
    num: Int;
}

struct Mid2 {
    inner: InnerMost;
}

struct Mid1 {
    mid2: Mid2;
}

contract OptionalDeep {
    value: Mid1?;

    init() {
        self.value = Mid1{
            mid2: Mid2{
                inner: InnerMost{ num: 555 }
            }
        };
    }
}