trait MyTrait {
    virtual const ENABLE: Bool = true;
}

contract TestVirtual with MyTrait {
    override const ENABLE: Bool = false;
    
    receive() {
        let flag: Bool = self.ENABLE; // Expected to be false
    }
}
