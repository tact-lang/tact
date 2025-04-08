struct OptionLevel2 {
    num: Int?;
    flag: Bool;
}

struct OptionLevel1 {
    inner: OptionLevel2?;
    txt: String;
}

contract NestedNullables {
    nestedOpt: OptionLevel1;

    init() {
        self.nestedOpt = OptionLevel1{
            inner: null,
            txt: "hi"
        };
    }
}