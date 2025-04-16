struct A {
    count: Int;
}
struct B {
    flag: Bool;
    a: A;
}

struct C {
    str: String;
    b: B;
}

contract DeepCompose {
    val: C;
    init() {
        self.val = C{
            str:"str",
            b:B{
                flag:true,
                a:A{count:123}
            }
        };
    }
}