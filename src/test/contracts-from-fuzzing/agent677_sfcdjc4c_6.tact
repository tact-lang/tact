struct L4 {
    val: Int?; 
    msg: String;
}

struct L3 {
    l4: L4;
    flag: Bool;
}

struct L2 {
    l3: L3;
    value: Int?;
}

struct L1 {
    l2: L2;
    s: String;
}

contract DeeplyNested4Levels {
    field: L1;

    init() {
        self.field = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        val: null,
                        msg: "level4"
                    },
                    flag: true,
                },
                value: 123,
            },
            s: "level1",
        };
    }

    receive() {
        let _ = self.field.l2.l3.l4.msg;
    }
}