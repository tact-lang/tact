struct Point {
    x: Int as uint8;
    y: Int as int16;
    name: String;
    active: Bool;
    content: Cell;
    payload: Slice;
    owner: Address;
    optionalVal: Int?;
}

contract ManyFields {
    p: Point;

    init() {
        self.p = Point{
            x: 1,
            y: -2,
            name: "hello",
            active: true,
            content: emptyCell(),
            payload: emptyCell().asSlice(),
            owner: myAddress(),
            optionalVal: null
        };
    }
}
