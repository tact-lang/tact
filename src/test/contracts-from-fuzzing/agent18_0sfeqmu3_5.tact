trait TraitX {
    // Virtual function with a default implementation
    virtual fun bar(): Int {
        return 10;
    }

    // Virtual constant with a default value
    virtual const valX: Int = 100;
}

trait TraitY with TraitX {
    // Override the virtual function bar
    override fun bar(): Int {
        return 20;
    }

    // Override the virtual constant valX
    override const valX: Int = 200;
}

trait TraitZ with TraitY {
    // No additional overrides; inherits behavior from TraitY and TraitX
}

contract D() with TraitZ {
    receive("test") {
        // Expected: bar() returns 20 and valX is 200, so result = 20 + 200 = 220
        let result = self.bar() + self.valX;
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: result.toString().asComment(),
        });
    }
}
