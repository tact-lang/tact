struct T1 {
    a: Int;
}
struct T2 {
    a: Int;
}
struct T3 {
    a: Int;
}
struct T4 {
    a: Int;
}
struct T5 {
    a: Int;
}
contract LongPersistent {
    f1:T1;
    f2:T2;
    f3:T3;
    f4:T4;
    f5:T5;
    init() {
        self.f1 = T1{a:1};
        self.f2 = T2{a:2};
        self.f3 = T3{a:3};
        self.f4 = T4{a:4};
        self.f5 = T5{a:5};
    }
}