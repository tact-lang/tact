// test struct with string and serialization pragma
struct StringPower {
    big: String;
    n: Int as uint32;
}

contract TestStringSerialize {
    data: StringPower;

    init() {
        self.data = StringPower{
            big: "hello",
            n: 65535
        };
    }
}
