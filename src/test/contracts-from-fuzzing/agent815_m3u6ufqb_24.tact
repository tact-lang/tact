contract InnerReassign {
    rec: RecStruct;

    init() {
        self.rec = RecStruct{
            a: 4,
            b: true
        };
        self.rec = RecStruct{
            a: 10,
            b: false
        };
    }
}

struct RecStruct {
    a: Int;
    b: Bool;
}
