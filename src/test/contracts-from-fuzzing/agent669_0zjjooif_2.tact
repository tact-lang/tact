struct BigNested {
    sub: SmallNested;
    val: Int;
}

struct SmallNested {
    flag: Bool;
    text: String;
    amount: Int?;
}

contract ComplexHolder {
    big: BigNested;

    init() {
        self.big = BigNested{
            sub: SmallNested{
                flag: true,
                text: "hi",
                amount: null
            },
            val: 123
        };
    }
}