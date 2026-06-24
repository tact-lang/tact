struct Deep1 {
    x: Int;
    txt: String;
}

struct Deep2 {
    d1: Deep1;
    flag: Bool;
}

struct Deep3 {
    d2: Deep2;
    optInt: Int?;
}

struct Deep4 {
    d3: Deep3;
    txt2: String;
    flag2: Bool?;
}

contract TestContract {
    data: Deep4;

    init() {
        self.data = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{x: 5, txt: "l1"},
                    flag: true
                },
                optInt: null
            },
            txt2: "hi",
            flag2: false
        };
    }
}