message(1234) EmptyMessage {}

contract EmptyMsgTest {
    m: EmptyMessage;
    
    init() {
        self.m = EmptyMessage{};
    }
}