struct BigOpt {
    a1: Int?; a2: Int?; a3: String?; a4: Int?; a5: String?; a6: Bool?; a7: String?; a8: Int?;
}

struct Deep1 { inner: BigOpt?; }
struct Deep2 { inner: Deep1?; }
struct Deep3 { inner: Deep2?; }
struct Deep4 { inner: Deep3?; }

contract TestContract {
    deep: Deep4;

    init() {
        self.deep = Deep4 {
            inner: Deep3 {
                inner: Deep2 {
                    inner: Deep1 {
                        inner: BigOpt {
                            a1:null,a2:null,a3:null,a4:null,a5:null,a6:null,a7:null,a8:null
                        },
                    },
                },
            },
        };
    }
}