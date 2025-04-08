struct Complex {
    num: Int;
    opt: Bool?;
    flag: Bool;
    txt: String;
}

contract OptionalInsideStruct {
    item: Complex = Complex{ num: 42, opt: null, flag: false, txt: "hi" };

    init() {
        self.item = Complex{ num: -1, opt: true, flag: true, txt: "bye" };
    }
}
