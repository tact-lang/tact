struct Fancy {
    x: Int as uint4 = 7;
    y: Bool?;
    s: String = "hi";
}

contract Test {
    data: Fancy = Fancy{};

    init() {
        self.data = Fancy{ x: 9, y: true, s: "boom" };
    }
}