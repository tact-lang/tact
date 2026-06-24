trait MyTrait {
    virtual const MY_CONST: Int = 100;
}

contract MyContract with MyTrait {
    override const MY_CONST: Int = 200;

    receive() {
         // Use the overridden constant
         let x: Int = self.MY_CONST;
         x;
    }
}
