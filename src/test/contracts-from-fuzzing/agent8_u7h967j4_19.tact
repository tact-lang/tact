struct HaveOption {
    foo: Int?;
    bar: Int;
}

contract MixOptAndReq {
    a: HaveOption;

    init() {
        self.a = HaveOption{ foo: null, bar: 5 };
    }
}