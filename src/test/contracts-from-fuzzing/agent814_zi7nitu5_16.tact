struct Strings {
    s1: String;
    s2: String?;
}

contract TestContract {
    data: Strings;

    init() {
        self.data = Strings{
            s1: "Hello",
            s2: null
        };
    }
}