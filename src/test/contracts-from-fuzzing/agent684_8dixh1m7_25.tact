struct DeepDefault {
    a: Int = 1;
    b: Bool = true;
    s: String = "x";
    o: Int?;
}

contract DefaultDeepTest {
    deep: DeepDefault;
    init() {
        self.deep = DeepDefault {
            o: null,
        };
    }
}