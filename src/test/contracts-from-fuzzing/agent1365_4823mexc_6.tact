struct BigOne {
    aa: Int;    ab: Int?;   ac: Bool;   ad: Bool?;   ae: String;
    af: String; ag: Slice; ah: Cell;   ai: Address;
    aj: Int;   ak: Int?;   al: Bool;   am: Bool?;   an: String;
    ao: String; ap: Slice; aq: Cell;   ar: Address;
}

contract Combo {
    x: BigOne;

    init() {
        self.x = BigOne{
            aa: 1, ab: null, ac: true, ad: false, ae: "a",
            af: "b", ag: emptyCell().asSlice(), ah: emptyCell(), ai: myAddress(),
            aj: 11, ak: 12, al: false, am: null, an: "c",
            ao: "d", ap: emptyCell().asSlice(), aq: emptyCell(), ar: myAddress(),
        };
    }
}