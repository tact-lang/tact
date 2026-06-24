struct InnerVal {
 x:Int; y:Bool;
}

contract NestedLists {
 in1:InnerVal; in2:InnerVal; in3:InnerVal; in4:InnerVal; in5:InnerVal;
 init(){
  self.in1=InnerVal{x:1,y:true}; self.in2=InnerVal{x:2,y:false};
  self.in3=InnerVal{x:3,y:true}; self.in4=InnerVal{x:4,y:false};
  self.in5=InnerVal{x:5,y:true};
 }
}