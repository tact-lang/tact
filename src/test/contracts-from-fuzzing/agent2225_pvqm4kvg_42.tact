struct ManyDefaultsMix {
    a:Int=1; b:String="b"; c:Int?=null; d:String?=null; e:Int=5; f:String="f";
}

contract ManyMix {
    data: ManyDefaultsMix;
    init() {
        self.data = ManyDefaultsMix{};
    }
}