message TestMessage { x: Int }

contract MapMessageTest {
    m: map<Int, TestMessage> = emptyMap();

    receive() {
        // Create a message instance and insert it into the map
        let tm: TestMessage = TestMessage { x: 42 };
        self.m.set(1, tm);
        let got: TestMessage? = self.m.get(1);
        dump(got!!.x); // Expect to dump 42
    }
}
