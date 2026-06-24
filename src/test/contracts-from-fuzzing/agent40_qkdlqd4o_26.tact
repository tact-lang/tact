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

struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

struct MixedLarge {
    intVal: Int;
    bools: ManyBools;
    strings: ManyStrings;
    addr: Address;
    optStr: String?;
}

contract StorageMixedLarge {
    st: MixedLarge;

    init() {
        self.st = MixedLarge{
            intVal:123,
            bools: ManyBools{a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false},
            strings: ManyStrings{s1:"a",s2:"b",s3:"c",s4:"d"},
            addr: myAddress(),
            optStr: null
        };
    }
}