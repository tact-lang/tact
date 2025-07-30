struct Stringy {
    s1: String;
    optS: String?;
}

contract TestContract {
    data: Stringy;

    init() {
        self.data = Stringy{
            s1: "hello",
            optS: null
        };
    }
}