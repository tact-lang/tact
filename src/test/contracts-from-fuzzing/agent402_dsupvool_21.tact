struct Data {
    s1: String = "Hello";
    s2: String = "World";
}

contract TestContract {
    d: Data;

    init() {
        self.d = Data{};
    }
}