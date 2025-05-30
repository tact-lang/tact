struct A{
    x: Int;
    y: Bool;
}

struct B{
    a: A;
    z: String;
}

contract ManyNestTypes{
    v: B;

    init(){
        self.v = B{
            a: A{
                x: 1,
                y: true,
            },
            z: "ok",
        };
    }
}
