struct BoolNest {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

struct BoolWrapper {
    inner: BoolNest;
    other: Bool;
}

contract BoolNestedStructs {
    val: BoolWrapper;

    init() {
        self.val = BoolWrapper{
            inner: BoolNest{
                b1:true, b2:null, b3:false, b4:null
            },
            other: true
        };
    }

    receive() {
        let v = self.val;
    }
}