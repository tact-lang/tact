trait T1 {
    virtual fun f(): Int {
        return 1;
    }
    
    virtual const c: Int = 10;
}

trait T2 {
    virtual fun f(): Int {
        return 2;
    }
    
    virtual const c: Int = 20;
}

contract M() with T1, T2 {
    // Must override the conflicting virtual function
    override fun f(): Int {
        return 1 + 2; // Expecting 3
    }
    
    // Override the conflicting constant
    override const c: Int = 10 + 20; // Expecting 30
    
    receive("test") {
        // This receiver sends a message containing the sum of f() and c
        // Expected result: 3 + 30 = 33
        let result = self.f() + self.c;
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: result.toString().asComment(),
        });
    }
}
