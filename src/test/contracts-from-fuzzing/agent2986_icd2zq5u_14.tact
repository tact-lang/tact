struct WideStruct {
    aa: Int;
    ab: Bool;
    ac: String;
    ad: Address;
    ae: Cell;
    af: Builder;
    ag: Slice;
    ah: Int;
    ai: Bool;
    aj: String;
    ak: Address;
    al: Cell;
    am: Builder;
    an: Slice;
}

contract WideStructField {
    w: WideStruct;

    init() {
        self.w = WideStruct{
            aa:1, ab:true, ac:"hi", ad:myAddress(), ae:emptyCell(), af:beginCell(), ag:emptyCell().asSlice(),
            ah:2, ai:false, aj:"bye", ak:myAddress(), al:emptyCell(), am:beginCell(), an:emptyCell().asSlice()
        };
    }
}