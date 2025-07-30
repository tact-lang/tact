struct Wrapper {
    num: Int;
    opt: Int?;
    txt: String;
    flag: Bool;
    sOpt: String?;
}

contract MixedOptionals {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            num: 10,
            opt: null,
            txt: "hello",
            flag: true,
            sOpt: null
        };
    }
}