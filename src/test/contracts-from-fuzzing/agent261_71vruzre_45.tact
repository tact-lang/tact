struct NestPartial {
    a: Int;
    b: Bool;
    s: String;
}

contract PartialDefaultNested {
    data: NestPartial;
    
    init() {
        self.data = NestPartial {
            a: 42,
            b: true,
            s: "hi"
        };
    }

    receive() {
        let _ = self.data.b;
    }
}