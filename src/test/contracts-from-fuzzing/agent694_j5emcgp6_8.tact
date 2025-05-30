struct MixTypes {
    foo: Int;
    bar: Bool;
    baz: String;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    mixed: MixTypes;

    init() {
        self.mixed = MixTypes{
            foo: 11,
            bar: true,
            baz: "hello",
            flag: null,
            text: null
        };
    }
}