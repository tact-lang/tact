struct Holder {
    owner: Address? = null;
    flag: Bool;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            flag: true
        };
    }
}