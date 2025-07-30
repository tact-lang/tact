struct TxtStruct {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringMix {
    data: TxtStruct;

    init() {
        self.data = TxtStruct{
            a: "alpha",
            b: null,
            c: "gamma",
            d: null
        };
    }
}