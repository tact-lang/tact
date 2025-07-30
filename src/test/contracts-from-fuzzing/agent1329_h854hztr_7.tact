struct NestedMixed {
    x: Int;
    y: String;
    z: Bool;
    opt: Int?;
}

contract MixedFields {
    data: NestedMixed;

    init() {
        self.data = NestedMixed{ x:1, y:"test", z:true, opt:null };
    }
}
