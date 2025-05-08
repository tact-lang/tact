struct T1 {
    a: Int;
}
struct T2 {
    a: T1;
}
struct T3 {
    a: T2;
}
struct T4 {
    a: T3;
}
struct T5 {
    a: T4;
}

contract FiveDeep {
    f: T5;

    init() {
        self.f = T5{a: T4{a: T3{a:T2{a:T1{a:1}}}}};
    }
}