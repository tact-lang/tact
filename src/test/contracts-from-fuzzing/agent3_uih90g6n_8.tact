trait Ownable {
    owner: Address;
    fun checkOwner(addr: Address): Bool {
         return (addr == self.owner);
    }
    get fun getOwner(): Address {
         return self.owner;
    }
}

contract Treasure with Ownable {
    owner: Address;
    init(addr: Address) {
         self.owner = addr;
    }
    receive() {
         dump(self.getOwner());
    }
}
