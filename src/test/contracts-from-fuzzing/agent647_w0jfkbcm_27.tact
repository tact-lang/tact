// Check explicit serialization of string field
struct StrSer {
    s: String;
    n: Int as uint32;
}

contract TestContract {
    data: StrSer;

    init() {
        self.data = StrSer{
            s: "hello",
            n: 123
        };
    }
}