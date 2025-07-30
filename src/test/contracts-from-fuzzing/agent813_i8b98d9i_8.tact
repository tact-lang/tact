struct Wrapped {
    flag: Bool;
    text: String;
}

contract OptionalStructContract {
    container: Wrapped?;

    init() {
        self.container = Wrapped{
            flag: true,
            text: "abc"
        };
    }
}