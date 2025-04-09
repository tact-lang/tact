struct L {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool;
    m: Int;
    n: Bool;
    o: Int;
    p: Bool;
    q: Int;
    r: Bool;
    s: Int;
    t: Bool;
}

struct R {
    u: Int;
    v: Bool;
    w: Int;
    x: Bool;
    y: Int;
    z: Bool;
}

struct TopLevel {
    left: L;
    right: R;
}

contract LargeNested {
    val: TopLevel;

    init() {
      self.val = TopLevel{
        left: L{
          a:1,b:true,c:2,d:true,e:3,f:true,g:4,h:true,i:5,j:true,
          k:6,l:true,m:7,n:true,o:8,p:true,q:9,r:true,s:10,t:true},
        right: R{
          u:11,v:false,w:12,x:false,y:13,z:false}
      };
    }
}