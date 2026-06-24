struct Info {
    n: Int;
    label: String?;
}

contract TestContract {
    details: Info?;

    init() {
        self.details = Info{
            n: 123,
            label: "hello",
        };
    }
}