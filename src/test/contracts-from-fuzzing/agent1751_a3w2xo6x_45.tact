struct OptionalMix {
    oInt: Int?;
    oBool: Bool?;
    oStr: String?;
    oAddr: Address?;
    oSlice: Slice?;
    oCell: Cell?;
}

contract OptionalMixContract {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            oInt:null, oBool:null, oStr:null, oAddr:null, oSlice:null, oCell:null
        };
    }
}
