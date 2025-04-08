struct Combination {
    x: Int;
    y: Bool;
    z: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract Test {
    c: Combination;

    init() {
        self.c = Combination{
            x: 5,
            y: false,
            z: "Hello",
            o1: null,
            o2: true,
            o3: null
        };
    }
}