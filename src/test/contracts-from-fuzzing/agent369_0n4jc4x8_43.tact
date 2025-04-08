struct TrailCommas {
    x: Int;
    y: Bool;
    z: String;
}

contract TrailCommasTest {
    st: TrailCommas;

    init() {
        self.st = TrailCommas{
            x: 123,
            y: true,
            z: "hello",
        };
    }
}