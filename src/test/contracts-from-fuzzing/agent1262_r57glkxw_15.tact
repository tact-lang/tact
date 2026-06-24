struct BoolOnly {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract TinyBool {
    data: BoolOnly;

    init() {
        self.data = BoolOnly{
            a:true, b:false, c:true
        };
    }
}