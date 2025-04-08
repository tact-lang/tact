struct BigOptional {
    x: Int?;
    y: Int?;
    z: Int?;
    s: String?;
    b: Bool?;
}

contract BigOptTest {
    val: BigOptional;

    init() {
        self.val = BigOptional{
            x: 1,
            y: null,
            z: 3,
            s: "hello",
            b: null
        };
    }
}