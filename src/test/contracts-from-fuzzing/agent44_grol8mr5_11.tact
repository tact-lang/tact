message(1) EmptyMsg {}

contract OptionalEmptyMsgFieldContract {
    opt: EmptyMsg?;

    init() {
        self.opt = null;
    }
}