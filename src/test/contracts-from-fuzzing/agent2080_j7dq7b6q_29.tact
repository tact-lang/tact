struct A { f: Int }
struct B { g: Int }
contract MultiStructs {
    x: A;
    y: B;
    init() {
        self.x = A{f:1};
        self.y = B{g:2};
    }
}