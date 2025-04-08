struct Holder {
    txt: String;
    txtOpt: String?;
}

contract TestContract {
    st: Holder;

    init() {
        self.st = Holder{
            txt: "Hello",
            txtOpt: null
        };
    }
}