struct ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract TestContract {
    flags: ManyBools;

    init() {
        self.flags = ManyBools {
            a:false,b:true,c:false,d:true,e:false,f:true,g:false,h:true
        };
    }

    receive() {
        dump(self.flags.d);
    }
}
