struct A { x: Int }
struct B { y: Int }
struct C { z: Int }

struct Container {
    a: A;
    b: B;
    c: C;
    text: String?;
    flag: Bool;
}

contract MultiStructs {
    data: Container = Container{a:A{x:1}, b:B{y:2}, c:C{z:3}, text:null, flag:false};

    init() {
        self.data = Container{a:A{x:4}, b:B{y:5}, c:C{z:6}, text:"q", flag:true};
    }
}
