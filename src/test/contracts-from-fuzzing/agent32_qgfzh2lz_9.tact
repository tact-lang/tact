struct SingleOpt { val: Int? }

contract TestOpt {
    s: SingleOpt;

    init() {
        self.s = SingleOpt{ val: null };
    }
}
