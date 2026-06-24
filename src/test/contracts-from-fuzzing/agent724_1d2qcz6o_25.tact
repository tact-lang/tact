struct MixOptSer {
    a: Int? as uint8;
    b: Bool;
    c: Int? as int64;
    d: String;
}

contract TestContract {
    m: MixOptSer;

    init() {
        self.m = MixOptSer{
            a: null,
            b: true,
            c: null,
            d: "hi"
        };
    }
}