struct NesterA { aa: Int; ab: Bool; }
struct NesterB { ba: String; bb: Address; bc: Cell; }
struct Outermost {
  na: NesterA;
  nb: NesterB;
  optBool: Bool?;
  optStr: String?;
  optAddr: Address?;
  optCell: Cell?;
}

contract NestedStructsManyOpts {
    data: Outermost;
    init() {
        self.data = Outermost{
            na: NesterA{ aa:1, ab:true },
            nb: NesterB{ ba:"hi", bb:myAddress(), bc:emptyCell() },
            optBool: null,
            optStr: null,
            optAddr: null,
            optCell: null
        };
    }
}