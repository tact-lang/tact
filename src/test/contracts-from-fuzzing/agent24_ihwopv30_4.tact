trait TVirtual {
    virtual fun bar(): Int { return 10; }
}

contract TestContract() with TVirtual {
    receive() {
        dump(self.bar());
    }
}
