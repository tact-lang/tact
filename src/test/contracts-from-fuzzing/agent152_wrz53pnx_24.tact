struct ManyInner {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address?;
}

struct Container {
    i1: ManyInner;
    i2: ManyInner;
    i3: ManyInner;
}

contract ManySameStruct {
    data: Container;

    init() {
        self.data = Container{
            i1:ManyInner{f1:1, f2:true, f3:"a", f4:null},
            i2:ManyInner{f1:2, f2:false, f3:"b", f4:null},
            i3:ManyInner{f1:3, f2:true, f3:"c", f4:null}
        };
    }
}
