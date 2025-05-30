// optional contract struct
struct NestedContract {
    a: Int;
    b: Bool;
}

contract TestContract {
    opt: NestedContract?;

    init() {
        self.opt = NestedContract{ a:1, b:true };
    }
}