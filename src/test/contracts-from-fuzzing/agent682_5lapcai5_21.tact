message MsgTest { x: Int }

contract TestContract {
    m: MsgTest;

    init() {
        self.m = MsgTest{x: 42};
    }
}