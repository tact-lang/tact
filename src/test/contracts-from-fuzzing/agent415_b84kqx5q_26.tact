struct OnlyInt { num: Int }

contract StructDefaultOpt {
    opt: OnlyInt?;

    init() {
        self.opt = null;
    }
}