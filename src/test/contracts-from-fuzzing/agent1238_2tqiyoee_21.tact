struct Reorder {
    x: Int;
    flag: Bool;
    y: Int;
    text: String;
    opt: Bool?;
}

contract OrderingStructTest {
    r: Reorder;

    init() {
        self.r = Reorder{
            x: 5,
            flag: true,
            y: 10,
            text: "text",
            opt: null
        };
    }
}