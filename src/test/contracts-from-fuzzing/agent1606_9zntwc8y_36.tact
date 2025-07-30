struct OptionNested {
    inner: Int?;
    text: String?;
}

contract OptionStructs {
    a: OptionNested;
    b: OptionNested;

    init() {
        self.a=OptionNested{inner:null, text:null};
        self.b=OptionNested{inner:null, text:null};
    }

    receive() {
        let _a = self.a;
        let _b = self.b;
    }
}