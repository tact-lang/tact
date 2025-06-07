struct ExtraInner {
    val: Int?;
    flag: Bool;
}

struct InnerX {
    aa: Int;
    bb: Bool;
    cc: ExtraInner;
}

contract DeepWithOptionals {
    deep: InnerX;

    init() {
        self.deep = InnerX{
            aa:5, bb:true, cc:ExtraInner{val:null,flag:false}
        };
    }
}