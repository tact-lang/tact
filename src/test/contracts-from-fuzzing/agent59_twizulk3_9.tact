trait Ownable {
    owner: Int;
    
    get fun getOwner(): Int {
        return self.owner;
    }
}

contract TestTrait with Ownable {
    owner: Int;
    
    init(owner: Int) {
        self.owner = owner;
    }
    
    receive() {
        dump(self.getOwner());
    }
}
