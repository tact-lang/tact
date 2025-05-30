struct S5 { 
    value: Int as int8; 
    flag: Bool;
}

struct S4 {
    s5: S5;
    note: String?;
}

struct S3 {
    s4: S4;
    count: Int as uint32;
}

struct S2 {
    s3: S3;
    enabled: Bool;
}

struct S1 {
    s2: S2;
    amount: Int;
}

contract DeepMixed {
    data: S1;

    init() {
        self.data = S1{
            s2:S2{
                s3:S3{
                    s4:S4{
                        s5:S5{value:7,flag:true},
                        note:null
                    },
                    count:4294967295
                },
                enabled:false
            },
            amount:12345
        };
    }

    receive() {
        let _ = self.data.s2.s3.s4.s5.value;
    }
}