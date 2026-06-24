struct Deep3 {
    x: Int;
    y: Bool;
    z: String?;
}

struct Deep2 {
    d3: Deep3;
    num: Int;
}

struct Deep1 {
    d2: Deep2;
    flag: Bool;
}

contract TestContract {
    deep: Deep1;

    init() {
        self.deep = Deep1{
            d2: Deep2{
                d3: Deep3{
                    x: 7,
                    y: false,
                    z: null,
                },
                num: 99,
            },
            flag: true,
        };
    }

    receive() {
        let _ = self.deep.d2.d3.x;
    }
}