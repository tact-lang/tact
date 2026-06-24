trait TraitWithVirtual {
    virtual fun getVal(): Int { return 7; }
}

contract TestContract() with TraitWithVirtual {
    receive() {
         dump(self.getVal());
    }
}
