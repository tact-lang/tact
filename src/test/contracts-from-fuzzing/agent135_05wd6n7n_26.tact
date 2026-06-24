struct ComplexMixed {
    x: Int;
    y: String;
    z: Bool;
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
}

contract ComplexMixedContract {
    data: ComplexMixed;

    init() {
        self.data = ComplexMixed{
            x:1,
            y:"hi",
            z:true,
            opt1:null,
            opt2:null,
            opt3:null
        };
    }
}
