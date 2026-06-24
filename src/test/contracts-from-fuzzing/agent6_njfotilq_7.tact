trait MyTrait {
    virtual const FLAG: Bool = true;
}

contract MyContract with MyTrait {
    override const FLAG: Bool = false;

    receive() {
        self.FLAG;
    }
}
