struct OptDeep {
    lv1: Int?;
    lv2: Int?;
    lv3: Int?;
    lv4: Int?;
    lv5: Int?;
    lv6: Int?;
}

contract OptDeepTest {
    deepOpt: OptDeep?;

    init() {
        self.deepOpt = OptDeep{
            lv1:null,lv2:null,lv3:null,lv4:null,lv5:null,lv6:null
        };
    }
}