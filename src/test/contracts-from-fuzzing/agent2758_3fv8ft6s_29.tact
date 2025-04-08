struct Mix {
    i: Int;
    b: Bool;
    s: String;
    io: Int?;
    bo: Bool?;
    so: String?;
    sub: SubStruct;
}

struct SubStruct {
    x: Int;
    y: String;
    z: Bool?;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            i: 3,
            b: true,
            s: "hey",
            io: null,
            bo: false,
            so: null,
            sub: SubStruct{ x: 7, y: "sub", z: null }
        };
    }
}