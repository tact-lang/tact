struct TenInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

struct TenBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
}

struct Container {
    ints: TenInts;
    bools: TenBools;
}

contract GroupedStorage {
    vals: Container;

    init() {
        self.vals = Container{
            ints: TenInts{
                a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
            },
            bools: TenBools{
                a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false,i:true,j:false
            }
        };
    }
}