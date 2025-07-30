struct A1 { i: Int }
struct A2 { i: Int }
struct A3 { i: Int }
struct A4 { i: Int }
struct A5 { i: Int }

contract ManySimilarStructFields {
    s1: A1;
    s2: A2;
    s3: A3;
    s4: A4;
    s5: A5;
    init() {
        self.s1=A1{i:1};self.s2=A2{i:2};self.s3=A3{i:3};self.s4=A4{i:4};self.s5=A5{i:5};
    }
}