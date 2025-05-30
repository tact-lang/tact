struct SubData2 {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
}

contract OptStructSome {
    info: SubData2?;

    init() {
        self.info = SubData2{
            a: 5,
            b: null,
            c: "ok",
            d: null,
        };
    }
}