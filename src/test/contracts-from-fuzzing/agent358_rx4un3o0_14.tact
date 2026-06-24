struct OptionalsInDeepLayers {
    lvl1: Int?;
    lvl2: Int?;
    lvl3: Int?;
    lvl4: Int?;
    lvl5: Int?;
}

contract DeepOptLayered {
    data: OptionalsInDeepLayers;

    init() {
        self.data = OptionalsInDeepLayers{
            lvl1:null, lvl2:null, lvl3:null, lvl4:null, lvl5:null
        };
    }
}
