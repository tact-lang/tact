struct Sub1 {
    s1: Int;
    s2: Bool;
    s3: String;
    s4: Int?;
    s5: Bool?;
    s6: String;
    s7: Int;
    s8: Bool;
    s9: String;
    s10: Int?;
}

struct Sub2 {
    q1: Int;
    q2: Bool?;
    q3: String;
    q4: Int?;
    q5: Bool;
    q6: String?;
    q7: Int;
    q8: Bool;
}

struct Sub3 {
    t1: Int;
    t2: Bool;
    t3: String?;
    t4: Int?;
    t5: Bool;
    t6: String;
}

contract MonsterStore {
    p1: Int; p2: Int; p3: Int; p4: Int; p5: Int;
    p6: Bool; p7: Bool; p8: Bool;
    p9: String; p10: String;
    p11: Int?; p12: Int?; p13: Bool?; p14: String?;
    subOne: Sub1;
    subTwo: Sub2;
    subThree: Sub3;
    
    init() {
        self.p1=1; self.p2=2; self.p3=3; self.p4=4; self.p5=5;
        self.p6=true; self.p7=false; self.p8=true;
        self.p9="hi"; self.p10="bye";
        self.p11=null; self.p12=null; self.p13=null; self.p14=null;
        self.subOne = Sub1{
            s1:1,s2:true,s3:"x",s4:null,s5:null,s6:"y",s7:7,s8:false,s9:"z",s10:null
        };
        self.subTwo = Sub2{
            q1:10,q2:null,q3:"a",q4:null,q5:true,q6:null,q7:70,q8:false
        };
        self.subThree = Sub3{
            t1:100,t2:true,t3:null,t4:null,t5:false,t6:"test"
        };
    }
}