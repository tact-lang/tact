struct Huge {
 f1: Int;
 f2: Int?;
 f3: Bool;
 f4: Bool?;
 f5: String;
 f6: String?;
 f7: Address;
 f8: Address?;
 f9: Int;
 f10: Int?;
 f11: Bool;
 f12: Bool?;
 f13: String;
 f14: String?;
 f15: Address;
 f16: Address?;
 f17: Int;
 f18: Int?;
 f19: Bool;
 f20: Bool?;
}

contract HugeFields {
 data: Huge;

 init() {
   self.data = Huge{
     f1:1,f2:null,f3:true,f4:null,f5:"a",f6:null,f7:myAddress(),f8:null,
     f9:2,f10:null,f11:false,f12:true,f13:"b",f14:"c",f15:myAddress(),f16:myAddress(),
     f17:7,f18:8,f19:false,f20:true
   };
 }
}