struct OptSub {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStructInPersist {
    data: OptSub? = null;
    init() {
        self.data = OptSub{ a: 1, b: true, c: "hi" };
    }
}
