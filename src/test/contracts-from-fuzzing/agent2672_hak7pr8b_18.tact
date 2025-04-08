struct CoinTypes {
 x: Int as coins;
 y: Int as uint64;
 z: Int as int256;
}

contract TestCoinsSerial {
 s: CoinTypes;
 init() {
   self.s = CoinTypes {
     x: ton("1"),
     y: 42,
     z: -100
   };
 }
}