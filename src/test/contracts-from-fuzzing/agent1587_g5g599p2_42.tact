struct Comp1 { a: Int; } 
struct Comp2 { b: String; }
struct Comp3 { c: Bool; } 
struct Comp4 { d: Int?; } 
struct Comp5 { e: String?; } 

contract ManyStructs {
    s1: Comp1;
    s2: Comp2;
    s3: Comp3;
    s4: Comp4;
    s5: Comp5;

    init() {
        self.s1=Comp1{a:1};
        self.s2=Comp2{b:"x"};
        self.s3=Comp3{c:true};
        self.s4=Comp4{d:null};
        self.s5=Comp5{e:null};
    }
}