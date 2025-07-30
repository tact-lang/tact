extends mutates fun double(self: Int) {
    self = self * 2;
}

contract Test {
    v: Int = 10;
    receive() {
         self.v.double();
         dump(self.v); // expected output: 20
    }
}
