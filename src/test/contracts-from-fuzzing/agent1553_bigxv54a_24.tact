struct Inner0 {
    v:Int;
}
struct Inner1 {
    s: Inner0;
}
struct Inner2 {
    s: Inner1;
}
struct Inner3 {
    s: Inner2;
}
struct Inner4 {
    s: Inner3;
}
struct Inner5 {
    s: Inner4;
}
struct Inner6 {
    s: Inner5;
}
struct Root {
    s: Inner6;
}
contract Nested7 {
    data: Root;
    init() {
        self.data = Root{s:Inner6{s:Inner5{s:Inner4{s:Inner3{s:Inner2{s:Inner1{s:Inner0{v:777}}}}}}}};
    }
}