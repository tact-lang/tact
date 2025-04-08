struct A1 { a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; }
struct A2 { g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?; }

contract ManyComplexFields {
    one: A1;
    two: A2;
    
    init() {
        self.one = A1{a:1,b:true,c:"x",d:null,e:null,f:null};
        self.two = A2{g:2,h:false,i:"y",j:null,k:null,l:null};
    }
}
