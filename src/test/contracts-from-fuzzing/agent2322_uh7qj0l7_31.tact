struct TestStr {
 val: String;
}

contract ContractStr {
 sfield: TestStr;
 init() {
   self.sfield = TestStr{ val: "hello world" };
 }
}
