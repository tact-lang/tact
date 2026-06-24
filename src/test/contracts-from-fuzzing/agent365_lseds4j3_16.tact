struct Combination {
    a: Int?;
    b: Bool;
    c: String;
}

contract MixComposite {
    data: Combination;

    init() {
        self.data = Combination{ a: 10, b: false, c: "hi" };
    }
}