struct Val1 { x: Int }
struct Val2 { y: Int }

contract ManyFields {
    a: Val1;
    b: Val2;
    c: Val1;
    d: Val2;
    e: Val1;
    f: Val2;

    init() {
        self.a=Val1{x:1};
        self.b=Val2{y:2};
        self.c=Val1{x:3};
        self.d=Val2{y:4};
        self.e=Val1{x:5};
        self.f=Val2{y:6};
    }
}