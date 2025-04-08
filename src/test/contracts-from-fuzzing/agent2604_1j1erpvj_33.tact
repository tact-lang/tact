struct EdgeMix {
  a:Int;
  b:Int?;
  c:Bool;
  d:Bool?;
  e:String;
  f:String?;
  g:Cell;
  h:Cell?;
  i:Slice;
  j:Slice?;
}

contract EdgeCase {
    val: EdgeMix;

    init() {
        self.val = EdgeMix{
            a:1,b:null,c:true,d:null,e:"e",f:null,
            g:emptyCell(),h:null,i:emptyCell().asSlice(),j:null
        };
    }
}