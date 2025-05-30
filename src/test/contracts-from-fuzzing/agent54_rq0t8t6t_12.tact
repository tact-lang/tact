struct MixedNested {
    inner1: Inner1?;
    inner2: Inner2;
}

struct Inner1 {
    value: Int?;
}

struct Inner2 {
    flag: Bool;
}

contract MixedNestedContract {
    storage: MixedNested;

    init() {
        self.storage = MixedNested{
            inner1: null,
            inner2: Inner2{flag: true}
        };
    }
}