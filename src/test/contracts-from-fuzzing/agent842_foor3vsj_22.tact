struct SOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStruct {
    s: SOpt?;

    init() {
        self.s = null;
    }

    receive() {
        let _=self.s;
    }
}