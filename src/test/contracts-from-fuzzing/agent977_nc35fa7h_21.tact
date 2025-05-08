// struct with many string fields
struct Strs {
  a: String;
  b: String;
  c: String;
  d: String;
  e: String;
  f: String;
}

contract ManyStrs {
    s: Strs;
    init() {
        self.s = Strs{
            a:"1",b:"2",c:"3",d:"4",e:"5",f:"6"
        };
    }
}