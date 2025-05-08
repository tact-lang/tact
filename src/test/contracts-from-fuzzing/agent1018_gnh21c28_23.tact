struct InnerInit {
    a: Int;
    b: Bool;
}

contract NestedInit {
    inner1: InnerInit = InnerInit{ a: 10, b: true };
    inner2: InnerInit = InnerInit{ a: 20, b: false };

    init() {
        self.inner1 = InnerInit{ a:11, b:false };
        self.inner2 = InnerInit{ a:21, b:true };
    }
}