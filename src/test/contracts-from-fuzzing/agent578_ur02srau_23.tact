struct DefaultOpt {
    x: Int?;
    y: String = "hi";
}

contract OptTest2 {
    field: DefaultOpt?;

    init() {
        self.field = DefaultOpt{ x: 42, y: "ok" };
    }
}