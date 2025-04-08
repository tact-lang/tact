struct LargeNested {
    inner1: Inner;
    inner2: Inner2;
}

struct Inner {
    a: Int;
    b: Int;
    c: Int;
    d: String;
    e: Bool;
    f: Cell;
    g: Slice;
}

struct Inner2 {
    s: String;
    addr: Address;
    flag: Bool?;
    num: Int;
}

contract ComplexNested {
    s: LargeNested;

    init() {
        self.s = LargeNested{
            inner1: Inner{
                a:1,b:2,c:3,d:"d",e:true,f:emptyCell(),g:emptyCell().asSlice()
            },
            inner2: Inner2{
                s:"s",addr:myAddress(),flag:null,num:42
            }
        };
    }

    receive() {}
}