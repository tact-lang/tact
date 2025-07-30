struct DeepNested {
    val: Int?;
    flag: Bool;
}

struct Middle {
    nested: DeepNested;
    comment: String;
}

struct Top {
    middle: Middle;
    address: Address;
}

contract TestContract {
    record: Top;
    init() {
        self.record = Top{
            middle: Middle{
                nested: DeepNested{val: null, flag: false},
                comment: "testing"
            },
            address: myAddress()
        };
    }
}