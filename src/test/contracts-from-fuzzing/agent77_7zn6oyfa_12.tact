// Test multiple nested structs, one with a long list of fields
struct BigStruct {
    a: Int; b: Bool; c: String; d: Int; e: Bool; f: String; g: Int; h: Bool;
    i: String; j: Int; k: Bool; l: String; m: Int; n: Bool; o: String; p: Int;
}

struct WrapBS {
    val: BigStruct;
    count: Int;
}

contract ManyInStruct {
  field: WrapBS;

  init() {
    self.field = WrapBS {
      val: BigStruct {
        a:1,b:true,c:"c",d:2,e:false,f:"f",g:3,h:true,i:"i",j:4,k:false,l:"l",m:5,n:true,o:"o",p:6
      },
      count: 42
    };
  }
}