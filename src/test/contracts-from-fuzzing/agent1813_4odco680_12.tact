struct VeryDeep {
    a: Int;
    next: Next1;
}
struct Next1 {
    a: Int;
    next: Next2;
}
struct Next2 {
    a: Int;
    next: Next3;
}
struct Next3 {
    a: Int;
    next: Next4;
}
struct Next4 {
    a: Int;
    next: Next5;
}
struct Next5 {
    a: Int;
}

contract ManyLayers {
    val: VeryDeep;

    init() {
        self.val = VeryDeep{
            a:1, next: Next1{
                a:2, next: Next2{
                    a:3, next: Next3{
                        a:4, next: Next4{
                            a:5, next: Next5{ a:6 }
                        }
                    }
                }
            }
        };
    }
}