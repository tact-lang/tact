struct ComplexOptional {
    num: Int?;
    flag: Bool?;
    str: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptStructs {
    val: ComplexOptional = ComplexOptional{
        num: null,
        flag: true,
        str: null,
        inner: null
    };

    init() {
        self.val = ComplexOptional{
            num: 7,
            flag: false,
            str: "hi",
            inner: InnerOpt{x:5, y:null}
        };
    }
}