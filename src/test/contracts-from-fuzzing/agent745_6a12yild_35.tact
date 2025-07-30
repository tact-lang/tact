struct Arranged {
    x: Int as uint32;
    y: Bool;
    z: String;
    p: Int?;
    q: String?;
}

contract MixedExample {
    val: Arranged;

    init() {
        self.val = Arranged{
            x: 42,
            y: true,
            z: "hi",
            p: null,
            q: null
        };
    }
}