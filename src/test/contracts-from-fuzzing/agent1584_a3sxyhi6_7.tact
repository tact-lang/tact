message(0x11111111) MsgTest { val: Int } 

contract TestContract {
    data: MsgTest?;

    init() {
        self.data = null;
    }
}