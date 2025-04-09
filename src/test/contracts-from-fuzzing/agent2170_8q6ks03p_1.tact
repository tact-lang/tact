struct Inner {
    flag: Bool;
    label: String;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            flag: true,
            label: "hello",
        };
    }
}