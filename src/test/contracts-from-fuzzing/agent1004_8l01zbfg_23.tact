// big nested struct with all serialization formats included
struct Leaf {
    a: Int as int32;
    b: Int as uint32;
    c: Bool;
    d: String;
}

struct Container {
    one: Leaf;
    two: Leaf;
}

struct Top {
    cont: Container;
    flag: Bool;
}

contract TestContract {
    root: Top;
    init() {
        self.root = Top{
            cont: Container{
                one: Leaf{ a:1, b:2, c:true, d:"X" },
                two: Leaf{ a:3, b:4, c:false, d:"Y" }
            },
            flag: true
        };
    }
}