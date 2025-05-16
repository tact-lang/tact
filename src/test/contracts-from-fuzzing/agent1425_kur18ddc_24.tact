struct D { num: Int = 1; opt: Bool?; }
struct C { d: D = D{ opt: null }; }
struct B { val: C; }

contract MixInit {
    state: B;
    init() { self.state = B{ val: C{} }; }
    receive() {}
}