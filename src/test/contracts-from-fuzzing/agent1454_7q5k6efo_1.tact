struct SimpleStruct { val: Int }

contract TestContract {
    s: SimpleStruct;

    init() {
        self.s = SimpleStruct{ val: 1 };
    }
    
    receive() {
        // reference field to ensure usage
        let _ = self.s.val;
    }
}