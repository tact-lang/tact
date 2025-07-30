struct DeepMany {
    l1: Int;
    l2: Int;
    l3: Int;
    l4: Int;
    l5: Int;
    l6: Int;
    l7: Int;
    l8: Int;
    l9: Int;
    l10: Int;
}

contract TestContract {
    deep1: DeepMany;
    deep2: DeepMany;

    init() {
        self.deep1 = DeepMany{
            l1:1, l2:2, l3:3, l4:4, l5:5,
            l6:6, l7:7, l8:8, l9:9, l10:10
        };
        self.deep2 = DeepMany{
            l1:11, l2:12, l3:13, l4:14, l5:15,
            l6:16, l7:17, l8:18, l9:19, l10:20
        };
    }
}