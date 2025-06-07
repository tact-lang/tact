struct Reordered {
    z: String;
    y: Bool?;
    x: Int;
}

contract StructOrder {
    data: Reordered;

    init() {
        self.data = Reordered{z: "hi", y: true, x: 42};
    }
}