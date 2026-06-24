const halfTon: Int = ton("0.5");

contract TestHalfTon() {
    get fun getHalfTon(): Int {
        return halfTon;
    }
    
    // A dummy receiver
    receive() {}
}
