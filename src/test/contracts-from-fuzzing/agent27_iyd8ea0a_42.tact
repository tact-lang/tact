struct Inner {
    text: String;
    flag: Bool;
}

contract BasicInner {
    data: Inner;

    init() {
        self.data = Inner{
            text: "nested",
            flag: true
        };
    }
}