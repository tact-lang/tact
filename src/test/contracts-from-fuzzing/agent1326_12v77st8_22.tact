struct Deep1 {
    a: Int;
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
contract Nest5 {
    data: Deep5;
    init() {
        self.data = Deep5{
            s: Deep4{
                s: Deep3{
                    s: Deep2{
                        s: Deep1{ a: 55 }
                    }
                }
            }
        };
    }
}