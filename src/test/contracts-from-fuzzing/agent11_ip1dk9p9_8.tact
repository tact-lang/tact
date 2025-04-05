trait T {
    x: Int;
}

contract C(x: Int) with T {
    // No explicit init() allowed because contract parameters are provided automatically
    receive() { 
        // simply use self.x
        let y = self.x;
    }
}
