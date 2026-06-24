struct Pair {
    a: Int;
    b: Int;
}

struct Wrapper {
    pair1: Pair;
    pair2: Pair;
    pair3: Pair;
    pair4: Pair;
    pair5: Pair;
    pair6: Pair;
    pair7: Pair;
    pair8: Pair;
    pair9: Pair;
    pair10: Pair;
}

contract TestContract {
    complex: Wrapper;
    init() {
        self.complex = Wrapper{
            pair1: Pair{a:1,b:2},
            pair2: Pair{a:3,b:4},
            pair3: Pair{a:5,b:6},
            pair4: Pair{a:7,b:8},
            pair5: Pair{a:9,b:10},
            pair6: Pair{a:11,b:12},
            pair7: Pair{a:13,b:14},
            pair8: Pair{a:15,b:16},
            pair9: Pair{a:17,b:18},
            pair10: Pair{a:19,b:20}
        };
    }
}