trait T1 {
    virtual fun v(): Int {
        return 1;
    }
}

trait T2 {
    virtual fun v(): Int {
        return 2;
    }
}

contract Combined() with T1, T2 {
    override fun v(): Int {
        // Proper override must resolve conflict between T1 and T2
        return 3;
    }
    
    receive() {
        dump(self.v()); // Expected output: 3
    }
}
