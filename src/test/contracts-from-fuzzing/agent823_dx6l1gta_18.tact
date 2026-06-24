struct Bottom {
    foo: Int = 7;
    bar: String = "ok";
}

struct Mid {
    val: Int = 3;
    deep: Bottom = Bottom{};
}

struct Top {
    id: Int?;
    mid: Mid?;
}

contract NullAssignDeepStruct {
    top: Top;

    init() {
        self.top = Top{
            id: null,
            mid: null
        };
    }

    receive() {}
}