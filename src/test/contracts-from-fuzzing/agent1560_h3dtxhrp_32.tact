struct Chain4 {
    d: Int;
}
struct Chain3 {
    c: Chain4;
}
struct Chain2 {
    b: Chain3;
}
struct Chain1 {
    a: Chain2;
}
contract TestContract {
    c: Chain1 = Chain1{a: Chain2{b: Chain3{c: Chain4{d: 42}}}};
}