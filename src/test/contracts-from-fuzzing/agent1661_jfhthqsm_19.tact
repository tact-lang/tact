struct Info {
    x: Int as uint8;
    y: String;
}

struct Holder {
    info: Info?;
    flag: Bool;
}

contract Combined {
    h: Holder = Holder{info: null, flag: false};

    init() {
        self.h = Holder{
            info: Info{x:5,y:"txt"},
            flag: true
        };
    }
}