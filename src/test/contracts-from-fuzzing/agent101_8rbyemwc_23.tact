struct CrazyNested {
 x: Int;
 y: Bool?;
 z: String;
}

struct WrapOpt {
 val: CrazyNested?;
}

struct Root {
 a: WrapOpt;
}

contract TestContract {
 root: Root;
 init() {
    self.root = Root{ a: WrapOpt{ val: null } };
 }
}