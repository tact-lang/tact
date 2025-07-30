struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract OptInStruct {
    s: InnerOpt;

    init() {
        self.s = InnerOpt{ a: null, b: null };
    }

    receive() {
        let aval = self.s.a != null ? self.s.a!! : 0;
        let bval = self.s.b != null ? !self.s.b!! : true;
        self.s = InnerOpt{ a: aval, b: bval };
    }
}