contract OutOfRange {
    x: Int as uint8;
    
    init() {
        // This assignment is out of expected range for uint8 because 500 > 255
        self.x = 500;
    }
}

fun main() {}
