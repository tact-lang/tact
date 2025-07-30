struct DefaultsAndOptions {
    a: Int = 1;
    b: Int?; // implicitly null
    c: String = "hi";
    d: Bool?; // implicitly null
}

contract DefOptTest {
    val: DefaultsAndOptions;

    init() {
        self.val = DefaultsAndOptions{};
    }
}