struct L3 {
  a: Int?;
  b: Int as uint8;
}

struct L2 {
  l3: L3?;
  c: Int as int16;
}

struct L1 {
  l2: L2?;
  d: Int as uint32;
}

contract TestContract {
    deep: L1;

    init() {
        self.deep = L1{
            l2: L2{
                l3: null,
                c: -1234
            },
            d: 9999
        };
    }
}