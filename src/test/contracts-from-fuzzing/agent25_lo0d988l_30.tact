// Contract with Address and Optionals in persistent state
contract TestContract {
    owner: Address;
    maybeOther: Address?;
    num: Int;
    flag: Bool?;

    init() {
        self.owner = myAddress();
        self.maybeOther = null;
        self.num = 1;
        self.flag = false;
    }
}