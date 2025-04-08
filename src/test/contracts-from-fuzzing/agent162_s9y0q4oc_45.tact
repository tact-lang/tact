struct D5 {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct D4 {
    nest: D5;
    x: Int as uint8;
}

struct D3 {
    nest: D4;
    y: Bool;
}

struct D2 {
    nest: D3;
    z: Int?;
}

struct D1 {
    nest: D2;
    p: String;
}

contract EdgeCase {
    data: D1;

    init() {
        self.data = D1{
            nest: D2{
                nest: D3{
                    nest: D4{
                        nest: D5{
                            a: null,
                            b: true,
                            c: "abc"
                        },
                        x: 128
                    },
                    y: false
                },
                z: null
            },
            p: "hello"
        };
    }
}