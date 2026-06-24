struct HasString {
    text: String;
}

struct OuterWithString {
    s: HasString;
    flag: Bool;
}

contract NestedString {
    data: OuterWithString;

    init() {
        self.data = OuterWithString{
            s: HasString{ text: "Hello world" },
            flag: true
        };
    }
}