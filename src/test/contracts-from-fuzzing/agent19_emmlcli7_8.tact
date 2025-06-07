trait InlineTrait {
    // An inline virtual function in a trait
    virtual inline fun inlineFun(): Int { return 100; }
}

contract InlineTest() with InlineTrait {
    // Override the inline virtual function
    override inline fun inlineFun(): Int { return 200; }

    // Receiver function to trigger inline function call
    receive("inline") {
         let result = self.inlineFun();
         reply(result.toString());
    }
}

// Helper inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
