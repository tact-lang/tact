struct OptStringInt {
    s: String?;
    i: Int?;
}

contract ComboOptInStruct {
    val: OptStringInt;
    init() {
        self.val = OptStringInt{ s:null, i:null };
    }
}