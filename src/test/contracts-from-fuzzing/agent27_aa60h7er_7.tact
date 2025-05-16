trait Timelock {
    // Virtual constant to control behavior at compile time
    virtual const ENABLE: Bool = true;
    
    // The function returns 1 if ENABLE is true, otherwise 2
    fun doSomething(): Int {
        if (self.ENABLE) {
            return 1;
        } else {
            return 2;
        }
    }
}

contract TestTimelock() with Timelock {
    // Override the virtual constant to disable the feature
    override const ENABLE: Bool = false;
    
    // Test function that returns the result of doSomething()
    fun test(): Int {
        return self.doSomething();
    }
    
    receive() {
        let res = self.test();
        reply(res.toString());
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
