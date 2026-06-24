struct AllOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptStructContract {
    data: AllOptionals;
    init() {
        self.data = AllOptionals{
            x: 77,
            y: true,
            z: "opt"
        };
    }
}