struct OptionCombo {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Builder?;
    o6: Slice?;
    o7: Address?;
}

contract TestContract {
    combo: OptionCombo;

    init() {
        self.combo = OptionCombo{
            o1:null, o2:null, o3: null, o4: null, o5:null, o6:null, o7:null
        };
    }
}