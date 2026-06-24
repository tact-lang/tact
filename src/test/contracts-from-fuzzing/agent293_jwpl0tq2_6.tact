struct Inner {
    amount: Int;
    note: String;
}

struct Middle {
    info: Inner;
    count: Int;
}

struct Outer {
    mid: Middle;
    flag: Bool;
    owner: Address;
}

contract DeeplyNested {
    value: Outer;

    init() {
        self.value = Outer{
            mid: Middle{
                info: Inner{amount: 100, note: "note"},
                count: 10
            },
            flag: true,
            owner: myAddress()
        };
    }
}