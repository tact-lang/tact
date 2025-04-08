struct ManySerializedInts {
  a: Int as uint1;
  b: Int as int8;
  c: Int as uint8;
  d: Int as int16;
  e: Int as uint16;
  f: Int as int32;
  g: Int as uint32;
  h: Int as int64;
  i: Int as uint64;
  j: Int as int128;
  k: Int as uint128;
  l: Int as coins;
}

contract SerialJumbo {
  dat: ManySerializedInts;

  init() {
    self.dat = ManySerializedInts{
      a:1, b:-5, c:5,d:-10,e:10,f:-20,g:20,h:-30,i:30,j:-40,k:40,l:ton("1")
    };
  }

  receive() {
    dump(self.dat.l);
  }
}