contract SendTest {
    fun testSend() {
         send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "hello".asComment()
         });
    }
    
    receive() {
         self.testSend();
         cashback(sender());
    }
}
