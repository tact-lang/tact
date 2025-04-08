struct MixStruct {
    a: Int; b: Bool?; c: String; d: String?; e: Bool;
    f: Address; g: Address?; h: Int?; i: Cell; j: Cell?;
}

contract MixContract {
    data: MixStruct;

    init() {
        self.data = MixStruct{
            a:1, b:null, c:"hi", d:null, e:true,
            f:myAddress(), g:null, h:null,
            i:emptyCell(), j:null
        };
    }
}