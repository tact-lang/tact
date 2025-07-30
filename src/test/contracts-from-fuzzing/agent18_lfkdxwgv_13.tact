struct Data {
    greeting: String;
}

contract Test {
    data: Data;

    init() {
        self.data = Data{
            greeting: "Hello, Fuzzer!",
        };
    }

    get fun getData(): Data {
        return self.data;
    }
}