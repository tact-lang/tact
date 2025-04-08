struct X {
    s: String;
    b: Bool;
    i: Int;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract LargeStructFields {
    data: X;

    init() {
        self.data = X{
            s: "test",
            b: true,
            i: -999,
            o1: null,
            o2: null,
            o3: null,
        };
    }
}