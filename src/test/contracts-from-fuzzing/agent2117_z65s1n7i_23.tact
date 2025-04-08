struct ManyOptionalMixed {
    a: Int?; b: Bool?; c: Cell?; d: Address?; e: Slice?; f: String?;
}

contract ManyOptionalsContract {
    storage: ManyOptionalMixed;
    init() {
        self.storage = ManyOptionalMixed{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}