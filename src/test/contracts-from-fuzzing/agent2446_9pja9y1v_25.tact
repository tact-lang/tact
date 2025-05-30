struct MixOptDef {
    a: Int? = null;
    b: Bool?;
    c: String? = null;
}

contract OptDefMix {
    val: MixOptDef;

    init() {
        self.val = MixOptDef{ b:true };
    }
}