struct Texty {
    s: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit 1234567890!";
}

contract TestContract {
    t: Texty;

    init() {
        self.t = Texty{};
    }
}
