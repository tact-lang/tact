message(0xBBBBBBBB) M { x: Int }

struct MixAll {
    x: Int = 1;
    optMsg: M?;
    y: Bool = false;
    text: String = "hi";
}

contract TestContract {
    mixed: MixAll;

    init() {
        self.mixed = MixAll{ optMsg: M{ x: 7 } };
    }
}
