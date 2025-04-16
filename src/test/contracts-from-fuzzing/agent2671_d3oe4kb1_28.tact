struct VirtuallyFlat {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

contract ManyFlatInts {
    st: VirtuallyFlat;

    init() {
        self.st = VirtuallyFlat{
            a:1,b:2,c:3,d:4,e:5,f:6
        };
    }
}