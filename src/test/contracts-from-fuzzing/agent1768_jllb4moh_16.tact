struct Deep1 {
    val: Int;
}
struct Deep2 {
    s: Deep1;
}
struct Deep3 {
    s: Deep2;
}
struct Deep4 {
    s: Deep3;
}
struct Deep5 {
    s: Deep4;
}
struct Deep6 {
    s: Deep5;
}
contract TestContract {
    data: Deep6;
    init() {
        self.data = Deep6{
            s: Deep5{
            s: Deep4{
            s: Deep3{
            s: Deep2{
            s: Deep1{
                val: 999
            }}}}}
        };
    }
    receive() {
        self.data.s.s.s.s.s.val = 321;
    }
}