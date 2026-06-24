// Constant default and override in init
contract TestContract {
    num: Int = 10;

    init() {
        self.num = 20;
    }
}
