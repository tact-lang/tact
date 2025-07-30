message(0x42) MsgEmpty {}

contract OptionMessageFieldTest {
    m: MsgEmpty?;

    init() {
        self.m = null;
    }
}