struct Deep1 { val1: Int; val2: Bool; }
struct Deep2 { d1: Deep1; opt: Int?; }
struct Deep3 { d2: Deep2; flag: Bool; val3: Int?; }

contract Test {
    payload: Deep3;

    init() {
        self.payload = Deep3 {
            d2: Deep2 {
                d1: Deep1 { val1:1, val2:true },
                opt: null
            },
            flag:false,
            val3:null
        };
    }

    receive() {
        self.payload = Deep3 {
            d2: Deep2 {
                d1: Deep1 { val1:self.payload.d2.d1.val1 + 10, val2: false },
                opt: 5
            },
            flag:true,
            val3: 100
        };
    }
}