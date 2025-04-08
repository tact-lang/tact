struct L {
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
    l11: Int;
    l12: Int;
    l13: Int;
    l14: Int;
    l15: Int;
}

contract LotsOfFields {
    heap: L;

    init() {
        self.heap = L{
            l1:1, l2:2, l3:3, l4:4, l5:5,
            l6:6, l7:7, l8:8, l9:9, l10:10,
            l11:11, l12:12, l13:13, l14:14, l15:15
        };
    }
}