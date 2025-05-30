message UniverseCalls {}

contract Test {
    rcv: Int = 0;
    
    // Underscore parameter usage: discards the parameter
    receive(_: UniverseCalls) {
         self.rcv = 42;
    }
}
