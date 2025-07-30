struct Bytes {
    s: String;
    opt: String?;
}

contract ByteStrings {
    val: Bytes;

    init() {
        self.val = Bytes{
            s: "hello",
            opt: null
        };
    }
}