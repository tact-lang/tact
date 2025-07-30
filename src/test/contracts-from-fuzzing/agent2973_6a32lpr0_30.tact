struct NestedSer {
    si: Int as int64;
    su: Int as uint64;
    flag: Bool;
    msg: String;
}

contract TestNestedSer {
    field: NestedSer;

    init() {
        self.field = NestedSer{
            si:-123456,
            su:123456,
            flag:true,
            msg:"check"
        };
    }
}