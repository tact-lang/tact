trait MyTrait {
    virtual const FEATURE: Bool = false;
}

contract TestVirtual with MyTrait {
    override const FEATURE: Bool = true;

    receive() {
        if (self.FEATURE) {
            let a: Int = 100;
        } else {
            let a: Int = 0;
        }
    }
}
