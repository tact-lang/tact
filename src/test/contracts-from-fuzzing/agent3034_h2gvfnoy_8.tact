struct Bytes {
    data: String;
}

contract StringTest {
    storage: Bytes;

    init() {
        self.storage = Bytes{
            data: "A string with unicode: 🚀🔐"
        };
    }
}