struct InnerArray {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
}

struct MiddleArray {
    m0: InnerArray;
    m1: InnerArray;
}

contract LayeredArrays {
    storage: MiddleArray;

    init() {
        self.storage = MiddleArray {
            m0: InnerArray{ a0:0,a1:1,a2:2,a3:3,a4:4 },
            m1: InnerArray{ a0:5,a1:6,a2:7,a3:8,a4:9 }
        };
    }
}