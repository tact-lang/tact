struct Deep1 {
    i: Int;
}
struct Deep2 {
    d1: Deep1;
}
struct Deep3 {
    d2: Deep2;
}
struct Deep4 {
    d3: Deep3;
}
struct Deep5 {
    d4: Deep4;
}
struct Deep6 {
    d5: Deep5;
}
struct Deep7 {
    d6: Deep6;
}
struct Deep8 {
    d7: Deep7;
}
contract ManyDeepLevels {
    root: Deep8;

    init() {
        self.root = Deep8{d7: Deep7{d6: Deep6{d5: Deep5{d4: Deep4{d3: Deep3{d2: Deep2{d1: Deep1{i: 42}}}}}}}};
    }

    receive() {
        self.root = self.root;
    }
}