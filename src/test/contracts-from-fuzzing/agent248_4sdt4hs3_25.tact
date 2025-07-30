struct Mixed {
    opt_int: Int?;
    plain_int: Int;
    opt_bool: Bool?;
    plain_bool: Bool;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            opt_int: null, plain_int:1,
            opt_bool:true, plain_bool:false
        };
    }
}