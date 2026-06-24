struct Wrap1 { x: Int?; }
struct Wrap2 { w1: Wrap1?; }

contract ChainOptionalFields {
    opt: Wrap2;

    init() {
        self.opt = Wrap2{ w1: Wrap1{ x: 9 } };
    }

    receive() {
        let o = self.opt;
        if(o.w1 != null && o.w1!!.x != null) {
            let v = o.w1!!.x!! + 1;
            let wrapped = Wrap1{ x: v };
            self.opt = Wrap2{ w1: wrapped };
        }
    }
}