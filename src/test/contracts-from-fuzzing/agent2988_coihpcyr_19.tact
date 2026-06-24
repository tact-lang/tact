struct Dummy { val: Int }
contract NoParamPureInit {
    data: Dummy;
    init() {
        self.data = Dummy{val:123};
    }
}