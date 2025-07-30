struct Data {
    txt: String;
}

contract TestContract {
    d: Data;

    init() {
        self.d = Data{
            txt: "Hello, 世界 👋",
        };
    }
}