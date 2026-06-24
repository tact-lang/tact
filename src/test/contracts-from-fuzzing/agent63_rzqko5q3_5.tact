trait WildTrait {
    virtual fun f(_ : Int): Int { return 1; }
}

contract Test with WildTrait {
    receive() {
       dump(self.f(456));
    }
}
