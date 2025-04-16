struct P1 { name:String; }
struct P2 { id:Int; }
struct P3 { value:Int; }
struct Container { a:P1; b:P2; c:P3; flag:Bool; note:String; }

contract WideNested {
    bundle: Container;

    init() {
        self.bundle = Container{
            a: P1{ name:"X" },
            b: P2{ id:11 },
            c: P3{ value:22 },
            flag: true,
            note: "hello"
        };
    }
}