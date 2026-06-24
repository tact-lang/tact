struct L {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = true;
    e: Bool = false;
    f: Int = 4;
    g: Bool = true;
    h: Int = 5;
}

struct M {
    l: L;
}

struct N {
    m: M;
}

contract DeepWide {
    data: N = N{
        m: M{
            l: L{ a:10, b:20, c:30, d:true, e:false, f:40, g:true, h:50 }
        }
    };
    receive() {}
}