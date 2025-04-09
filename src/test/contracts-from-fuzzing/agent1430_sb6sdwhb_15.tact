struct SingleOpt {
    x: Int?;
}

contract TestContract {
    so: SingleOpt;

    init() {
        self.so = SingleOpt{
            x: null
        };
    }
}
