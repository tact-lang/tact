struct NestedBool {
    s1: Bool;
    s2: Bool;
    s3: Bool;
    s4: Bool;
    s5: Bool;
}

struct Wrap {
    inner: NestedBool;
}

contract Test {
    state: Wrap;

    init() {
        self.state = Wrap{
            inner: NestedBool{
                s1:true,s2:false,s3:true,s4:false,s5:true
            }
        };
    }
}