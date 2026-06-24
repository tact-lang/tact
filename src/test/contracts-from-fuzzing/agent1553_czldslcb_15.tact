struct S {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: String?;
}

contract OptInsideStruct {
    data: S;
    init() {
        self.data = S{
            f1: 42,
            f2: null,
            f3: "data",
            f4: null
        };
    }
}