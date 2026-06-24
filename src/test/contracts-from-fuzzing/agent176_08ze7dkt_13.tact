struct Sub {
    a: Int;
    b: String;
}

contract OptNestedStruct {
    s: Sub?;
    init() {
        self.s = Sub{ a: 1, b: "hey" };
    }
}