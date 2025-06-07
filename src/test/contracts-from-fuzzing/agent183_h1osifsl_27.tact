struct SOpt {
  i: Int?;
  b: Bool?;
}
struct WrapS {
 s: SOpt?;
}
contract OptInOpt {
    w: WrapS?;

    init() {
        self.w = WrapS{
            s: SOpt{
                i: null,
                b: null
            }
        };
    }
}