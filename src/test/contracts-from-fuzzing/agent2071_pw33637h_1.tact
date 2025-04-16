struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    coord: Coord;
}

struct Coord {
    x: Int;
    y: Int;
}

contract TestNested {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested {
            inner: InnerStruct {
                flag: true,
                coord: Coord{
                    x: 7,
                    y: 42,
                },
            },
        };
    }
}