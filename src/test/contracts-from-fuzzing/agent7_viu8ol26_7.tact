struct Point {
    x: Int;
    y: Int;
}

struct Param {
    name: String;
    coords: Point?;
}

contract OptionalStructFieldContract {
    param: Param;

    init() {
        self.param = Param{
            name: "foo",
            coords: null,
        };
    }
}
