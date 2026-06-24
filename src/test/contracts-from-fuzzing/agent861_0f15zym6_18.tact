struct A { v: Int; }
struct B { a:A; v2:Int; }
struct C { b:B; v3:Int; }
struct D { c:C; v4:Int; }
contract DeepWide {
    data: D;

    init() {
        self.data = D{ c: C{ b: B{ a: A{v:1}, v2:2}, v3:3}, v4:4 };
    }

    receive() {
        let _ = self.data;
    }
}