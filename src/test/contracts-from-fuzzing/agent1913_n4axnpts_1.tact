struct Nested {
    num: Int;
    flag: Bool;
}

struct Holder {
    inner: Nested;
    text: String;
    optNum: Int?;
}

contract DeepStructs {
    data: Holder;

    init() {
        self.data = Holder{
            inner: Nested{
                num: 1,
                flag: true,
            },
            text: "hi",
            optNum: null,
        };
    }
}