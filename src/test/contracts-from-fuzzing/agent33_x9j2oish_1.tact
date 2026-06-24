struct Coordinates {
    x: Int;
    y: Int;
}

struct Wrapper {
    coord: Coordinates;
    flag: Bool;
}

contract NestedStructField {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            coord: Coordinates{
                x: 1,
                y: 2,
            },
            flag: true,
        };
    }
}