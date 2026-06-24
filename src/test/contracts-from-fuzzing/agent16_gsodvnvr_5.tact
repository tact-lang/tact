contract IntTest {
    // Define a field 'a' as a signed 7-bit integer in the range -64 to 63, using the format 'Int as int7'
    a: Int as int7 = 42;
    
    receive() {
       cashback(sender());
    }
}
