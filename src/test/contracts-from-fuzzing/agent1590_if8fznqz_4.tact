struct ContainsOptional {
    val: Int?;
    text: String;
    flag: Bool;
}

contract OptContract {
    state: ContainsOptional;

    init() {
        self.state = ContainsOptional{
            val: null,
            text: "hello",
            flag: true
        };
    }
}