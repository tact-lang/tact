struct A { x: Int }

struct B { s0: A; s1: A; s2: A; s3: A; s4: A; s5: A; s6: A; s7: A; s8: A; s9: A;
            s10: A; s11: A; s12: A; s13: A; s14: A; s15: A; s16: A; s17: A; s18: A; s19: A; }

contract TestContract {
    data: B;

    init() {
        self.data = B{
            s0: A{x:0}, s1: A{x:1}, s2: A{x:2}, s3: A{x:3}, s4: A{x:4},
            s5: A{x:5}, s6: A{x:6}, s7: A{x:7}, s8: A{x:8}, s9: A{x:9},
            s10: A{x:10}, s11: A{x:11}, s12: A{x:12}, s13: A{x:13}, s14: A{x:14},
            s15: A{x:15}, s16: A{x:16}, s17: A{x:17}, s18: A{x:18}, s19: A{x:19}
        };
    }
}