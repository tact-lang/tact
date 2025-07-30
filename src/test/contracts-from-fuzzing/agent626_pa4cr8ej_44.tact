struct ManyOption {
    a: Int?; b: Bool?; c: String?; d: Address?; e: Cell?; f: Slice?; g: Builder?;
}

contract ManyOptionalStruct {
    s: ManyOption;

    init() {
        self.s = ManyOption{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}