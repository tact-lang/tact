// persistent struct with many small bool fields

struct Flags {
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
    flags: Flags;
    init() {
        self.flags = Flags{
            a:true,b:false,c:true,d:false,
            e:true,f:false,g:true,h:false
        };
    }
}