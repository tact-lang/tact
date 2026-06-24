struct Data {
    val: Int;
    text: String?;
}

contract OptionalStructStore {
    maybeData: Data?;

    receive() {
        self.maybeData = Data{
            val: 9,
            text: "hi",
        };
    }
}