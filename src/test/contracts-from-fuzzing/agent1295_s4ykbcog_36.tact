// deeply nested optional message structs (not nested optionals)
message(0x1) M3 { c: Int; }
message(0x2) M2 { b: M3?; }
message(0x3) M1 { a: M2?; }

contract DeepMsgOpt {
    val: M1?;

    init() {
        self.val = M1{
            a: M2{
                b: M3{ c: 5 }
            }
        };
    }
}