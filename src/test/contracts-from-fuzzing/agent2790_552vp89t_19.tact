struct DeepWide {
  a:Int;
  b:Int;
  c:Int;
  d:Int;
  e:Int;
  f:Wide2;
}

struct Wide2 {
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Wide3;
}

struct Wide3 {
    l: Bool;
    m: Cell;
    n: Slice;
}

contract Test {
    dw: DeepWide;

    init() {
        self.dw = DeepWide{
            a:1,b:2,c:3,d:4,e:5,
            f: Wide2{
                g:6,h:true,i:"hello",j:myAddress(),
                k: Wide3{l:false,m:emptyCell(),n:emptyCell().asSlice()}
            }
        };
    }
}