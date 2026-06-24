struct S {
    flag: Bool;
    amount: Int?;
    name: String;
    text: String?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            flag: true,
            amount: null,
            name: "hello",
            text: null
        };
    }
}