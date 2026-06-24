struct X { value: Int; }

contract Contradict {
    x: X?;

    init() {
        self.x = null;
    }
    
    get fun getX(): X? {
        return self.x;
    }
}