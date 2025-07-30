struct ContainString {
    s: String;
    opt: String?;
}

contract TestContract {
    data: ContainString;

    init() {
        self.data = ContainString{
            s: "abc",
            opt: null
        };
    }
}