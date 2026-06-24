struct Deep {
    n1: Int;
    n2: Int;
    n3: Int;
    n4: Int;
    n5: Int;
    n6: Int;
    n7: Int;
    n8: Int;
    n9: Int;
    n10: Int;
    n11: Int;
    n12: Int;
    n13: Int;
    n14: Int;
    n15: Int;
    n16: Int;
    n17: Int;
    n18: Int;
    n19: Int;
    n20: Int;
}

contract Test {
    data: Deep;

    init() {
        self.data = Deep{
            n1:1, n2:2, n3:3, n4:4, n5:5, n6:6, n7:7, n8:8, n9:9, n10:10,
            n11:11, n12:12, n13:13, n14:14, n15:15, n16:16, n17:17, n18:18, n19:19, n20:20
        };
    }
}