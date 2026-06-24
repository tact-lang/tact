fun f(): Int { return 999; }

trait MyTrait {
    virtual fun f(): Int {
        return 100;
    }
}

contract Test() with MyTrait {
    receive() {
        let a = self.f(); // should be 100 from the trait
        let b = f();      // should be 999 from the global function
        return;
    }
}
