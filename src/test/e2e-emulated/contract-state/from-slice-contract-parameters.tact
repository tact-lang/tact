//
// Test.fromSlice(self.toSlice()) = self
//

message NewContractData {
    slice: Slice;
}

contract Test(
  x: Int as uint32,
  y: Int as uint32,
) {

    receive() { }

    receive(msg: NewContractData) {
        let c = Test.fromSlice(msg.slice);
        self.x = c.x;
        self.y = c.y;
    }

    get fun state(): Test {
        return self;
    }
    get fun inverseLaw(): Bool {
        return (Test.fromSlice(self.toSlice())).toSlice() == self.toSlice();
    }
}


