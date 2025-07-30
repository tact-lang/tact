struct Defaulted {
    n: Int = 10;
    b: Bool = false;
    s: String = "hi";
}

contract DefaultTest {
    data: Defaulted = Defaulted{};

    receive() {
        self.data = Defaulted{ n: 5, b: true, s: "bye" };
    }
}