message(1) SomeData { val: Int; }

contract OptMsgTest {
    foo: SomeData?;
    
    init() {
        self.foo = SomeData{ val: 42 };
    }
}