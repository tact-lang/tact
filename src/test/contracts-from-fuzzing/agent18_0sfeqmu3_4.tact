trait TraitX {
    // Virtual function with a default implementation
    virtual fun bar(): Int {
        return 10;
    }

    // Virtual constant with a default value
    virtual const valX: Int = 100;
}

// TraitY inherits from TraitX and overrides its virtual members
trait TraitY with TraitX {
    override fun bar(): Int {
        return 20;
    }

    override const valX: Int = 200;
}

// Contract C implements TraitY (and by inheritance, TraitX)
contract C() with TraitY {
    // Receiver function to test the behavior of the traits
    receive("test") {
        // Expected: bar() returns 20, valX is 200, so sum = 220
        let result = self.bar() + self.valX;
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: result.toString().asComment(),
        });
    }
}
