// Contract assigning big int into a small serialization-size persistent variable
contract IntOverflow {
    small: Int as uint8;

    init() {
        self.small = 300; // deliberately overflow (over 255)
    }
}