struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Int;
    c: Inner1;
}
struct Inner3 {
    d: Int;
    e: Inner2;
}

contract MultiNested {
    val: Inner3;

    init() {
        self.val = Inner3{
            d: 1,
            e: Inner2{
                b: 2,
                c: Inner1{
                    a:3,
                },
            },
        };
    }
}