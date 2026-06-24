struct TwoLevelOptionals {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
}

contract TestContract {
    stored: TwoLevelOptionals;

    init() {
        self.stored = TwoLevelOptionals{
            innerOpt: null,
        };
    }

    receive() {
        let _ = self.stored.innerOpt;
    }
}