struct Holder1 {
    a:Int;
    b:Bool;
}

struct Holder2 {
    s: Holder1;
    x: Int;
}

struct Holder3 {
    s2: Holder2;
    y: Int;
}

contract DeepNestedContract {
    z: Holder3;

    init() {
        self.z = Holder3{
            s2: Holder2{
                s: Holder1{ a:1, b:true },
                x:2
            },
            y:3
        };
    }
}