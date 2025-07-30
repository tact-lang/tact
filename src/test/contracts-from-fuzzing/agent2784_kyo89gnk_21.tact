struct LongOrder {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String?;
 g: Address;
 h: Bool;
 i: Int;
}

contract ManyTypes {
 val: LongOrder;

 init() {
   self.val = LongOrder{
     a:1,
     b:true,
     c:"test",
     d:null,
     e:null,
     f:null,
     g:myAddress(),
     h:false,
     i:42
   };
 }
}