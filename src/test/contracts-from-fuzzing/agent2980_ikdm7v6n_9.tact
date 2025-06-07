struct Rec1 {
    rec2: Rec2;
    val: Int;
}

struct Rec2 {
    rec3: Rec3;
    val2: Bool;
}

struct Rec3 {
    rec4: Rec4;
    s: String;
}

struct Rec4 {
    num: Int as uint32;
    flag: Bool;
}

contract Test {
    container: Rec1;

    init() {
        self.container = Rec1{
            rec2: Rec2{
                rec3: Rec3{
                    rec4: Rec4{
                        num:77,
                        flag:true
                    },
                    s:"done"
                },
                val2:false
            },
            val:5
        };
    }
}