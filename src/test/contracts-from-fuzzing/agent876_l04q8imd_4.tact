struct ManyFields {
    a1: Int;
    a2: Bool;
    a3: Int;
    a4: Bool;
    a5: Int;
    a6: Bool;
    a7: Int;
    a8: Bool;
    a9: Int;
    a10: Bool;
    a11: Int;
    a12: Bool;
}

contract WideStructContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a1:1,a2:true,a3:2,a4:false,a5:3,a6:true,a7:4,a8:false,a9:5,a10:true,a11:6,a12:false
        };
    }

    receive() {
        dump(self.data.a12);
    }
}