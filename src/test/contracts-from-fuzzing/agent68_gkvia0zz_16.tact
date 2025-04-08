struct SS1 { a: Int }
struct SS2 { b: Bool }
struct SS3 { c: Int? }

struct BigNest {
    s1: SS1;
    s2: SS2;
    s3: SS3;
}

contract BignestContract {
    f1: BigNest;
    f2: BigNest;
    f3: BigNest;
    f4: BigNest;

    init() {
        self.f1 = BigNest{s1:SS1{a:1},s2:SS2{b:true},s3:SS3{c:null}};
        self.f2 = BigNest{s1:SS1{a:2},s2:SS2{b:false},s3:SS3{c:5}};
        self.f3 = BigNest{s1:SS1{a:3},s2:SS2{b:true},s3:SS3{c:null}};
        self.f4 = BigNest{s1:SS1{a:4},s2:SS2{b:false},s3:SS3{c:10}};
    }
}