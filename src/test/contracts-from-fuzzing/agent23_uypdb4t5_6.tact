trait TraitB {
    // Virtual function with default implementation
    virtual fun doSomething(): Int {
        return 1;
    }
}

trait TraitA with TraitB {
    // Override the inherited function from TraitB
    override fun doSomething(): Int {
        return 2;
    }
}

contract TestLayer() with TraitA {
    // Further override the function doSomething()
    override fun doSomething(): Int {
        return 3;
    }

    receive() {
        let result = self.doSomething();
        reply(result.toString());
    }
}

// Utility inline function to send a reply message
inline fun reply(s: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: s.asComment(),
    });
}
