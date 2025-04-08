struct BoolWrap {
 flag: Bool;
}

contract BoolDefault {
 f1: BoolWrap = BoolWrap{ flag: true };
 f2: BoolWrap;

 init() {
   self.f2 = BoolWrap{ flag: false };
 }
}
