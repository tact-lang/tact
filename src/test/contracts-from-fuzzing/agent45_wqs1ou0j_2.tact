const TON1: Int = ton("1");
const A: Int = ascii("⚡");
const CRC: Int = crc32("000DEADBEEF000");
const MOON: Int = 1730 + (8 | 8);

contract TestConstants() {
    get fun get_TON1() : Int {
         return TON1;
    }
    
    get fun get_A() : Int {
         return A;
    }
    
    get fun get_CRC() : Int {
         return CRC;
    }
    
    get fun get_MOON() : Int {
         return MOON;
    }
}
