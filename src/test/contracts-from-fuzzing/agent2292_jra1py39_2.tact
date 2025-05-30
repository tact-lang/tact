struct Coord {
    a: Int;
    b: Int;
    foo: Bool?;
}

contract DeepOptionTest {
    pos: Coord?;

    init() {
        self.pos = Coord{
            a: 10,
            b: 20,
            foo: null
        };
    }
}