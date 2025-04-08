struct LargeNested {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

struct Inner {
    i1: Int;
    i2: Bool;
    i3: Address;
    i4: String;
}

contract TestContract {
    field: LargeNested;

    init() {
        self.field = LargeNested{
            a: Inner{i1:1,i2:true,i3:myAddress(),i4:"a"},
            b: Inner{i1:2,i2:false,i3:myAddress(),i4:"b"},
            c: Inner{i1:3,i2:true,i3:myAddress(),i4:"c"},
            d: Inner{i1:4,i2:false,i3:myAddress(),i4:"d"}
        };
    }
}