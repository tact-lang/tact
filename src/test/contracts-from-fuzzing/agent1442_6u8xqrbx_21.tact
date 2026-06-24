// test very wide struct in persistent state - 12 fields
struct Wide {
  a:Int; b:Int; c:Int; d:Int;
  e:Int; f:Int; g:Int; h:Int;
  i:Int; j:Int; k:Int; l:Int;
}

contract TestContract {
    w: Wide;
    init() {
        self.w = Wide{
          a:1,b:2,c:3,d:4,
          e:5,f:6,g:7,h:8,
          i:9,j:10,k:11,l:12
        };
    }
}