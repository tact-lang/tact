struct MixOptInner {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

struct MixOptOuter {
    inner: MixOptInner?;
    flag: Bool;
}

contract MixOptCombined {
    val: MixOptOuter;

    init() {
        self.val = MixOptOuter{
            inner:null, flag:false
        };
    }
}