// Testing very long flat struct with mixed primitive types

struct FatStruct {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
    m: Int; n: Bool; o: String; p: Int?; q: Bool?; r: String?;
}

contract FatStructTest {
    s: FatStruct;
    init() {
      self.s = FatStruct{
        a:1,b:true,c:"c",d:2,e:false,f:null,
        g:3,h:false,i:"i",j:null,k:true,l:"l",
        m:9,n:true,o:"o",p:null,q:null,r:"r"
      };
    }
}