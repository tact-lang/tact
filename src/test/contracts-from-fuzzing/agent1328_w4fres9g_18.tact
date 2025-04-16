struct HasBool {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
}

contract BoolFields {
    val: HasBool;

    init() {
        self.val = HasBool{
            f1:true,
            f2:false,
            f3:true,
            f4:false
        };
    }
}
