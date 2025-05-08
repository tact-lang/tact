message(123) M1 {
    f1:Int;
    f2:Bool;
}

contract MsgInFields {
    m: M1;

    init() {
        self.m = M1{f1:10, f2:true};
    }
}
