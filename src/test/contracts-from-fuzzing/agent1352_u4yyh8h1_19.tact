message(0x99999999) MaybeMsg { val: Int }

contract TestContract {
    maybeMsg: MaybeMsg?;

    init() {
        self.maybeMsg = MaybeMsg{ val: 77 };
    }
}
