struct Params {
    x: Int?;
    y: Int?;
    z: Int?;
    s: String?;
    b: Bool?;
}

contract AllNulls {
    data: Params;

    init() {
        self.data = Params {
            x: null,
            y: null,
            z: null,
            s: null,
            b: null,
        };
    }
}