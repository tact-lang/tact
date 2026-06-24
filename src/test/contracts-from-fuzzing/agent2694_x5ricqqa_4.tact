struct OptionNested {
    val1: Int?;
    val2: Bool?;
    inner: InnerOptional?;
}

struct InnerOptional {
    flag: Bool?;
    amount: Int?;
}

contract TestContract {
    data: OptionNested;

    init() {
        self.data = OptionNested{
            val1: null,
            val2: true,
            inner: InnerOptional{
                flag: null,
                amount: 99
            }
        };
    }
}
