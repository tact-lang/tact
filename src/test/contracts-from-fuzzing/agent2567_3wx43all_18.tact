struct SLeaf {
 x: Int;
 y: Bool;
}

struct SParent {
 child: SLeaf;
 number: Int;
 flag: Bool;
 text: String;
}

contract AssignedDeep {
 s: SParent;
 init(){
  self.s = SParent{
    child: SLeaf{x:42,y:true},
    number:7,
    flag:false,
    text:"hi"
  };
 }
}