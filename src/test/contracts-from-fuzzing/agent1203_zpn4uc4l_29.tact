struct S1{field1:Int;}
struct S2{field2:Int;}
struct S3{field3:Int;}
struct S4{field4:Int;}
struct S5{field5:Int;}

contract ManyNestedStructs {
    s1:S1;
    s2:S2;
    s3:S3;
    s4:S4;
    s5:S5;
    init(){
        self.s1=S1{field1:1};
        self.s2=S2{field2:2};
        self.s3=S3{field3:3};
        self.s4=S4{field4:4};
        self.s5=S5{field5:5};
    }
}