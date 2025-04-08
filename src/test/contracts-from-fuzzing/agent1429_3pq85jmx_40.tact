struct Embed { val: Int; }

contract OptStruct {
    opt: Embed?;

    init() {
        self.opt = null;
    }
}