struct Weird {
    x: Int? = 42;
    y: Bool? = true;
    z: String? = "hi";
}

contract WeirdTest {
    w: Weird;

    init() {
        self.w = Weird{};
    }
}