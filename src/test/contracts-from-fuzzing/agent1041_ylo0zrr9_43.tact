message(1) M1 {}
message(2) M2 {}

struct MStruct {
    a: M1;
    b: M2;
}

contract TwoEmptyMsgs {
    data: MStruct;

    init() {
        self.data = MStruct{
            a: M1{},
            b: M2{}
        };
    }
}
