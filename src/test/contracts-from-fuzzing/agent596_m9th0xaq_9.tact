struct LargeNested {
    a: Int;
    b: Level1;
}

struct Level1 {
    c: Int;
    d: Level2;
}

struct Level2 {
    e: Int;
    f: Level3;
}

struct Level3 {
    g: Int;
    h: Level4;
}

struct Level4 {
    i: Int;
    j: Level5;
}

struct Level5 {
    k: Int;
    l: Level6;
}

struct Level6 {
    m: Int;
    n: Level7;
}

struct Level7 {
    o: Int;
    p: Level8;
}

struct Level8 {
    q: Int;
    r: Level9;
}

struct Level9 {
    s: Int;
}

contract DeepNine {
    d: LargeNested;

    init() {
        self.d = LargeNested{
            a: 0,
            b: Level1{
                c:1,d:Level2{
                    e:2,f:Level3{
                        g:3,h:Level4{
                            i:4,j:Level5{
                                k:5,l:Level6{
                                    m:6,n:Level7{
                                        o:7,p:Level8{
                                            q:8,r:Level9{ s:9 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}