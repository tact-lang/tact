struct NestedStruct {
    flag: Bool;
    text: String;
}

contract DeepOptionalTest {
    data: NestedStruct?;
    
    init() {
        self.data = null;
    }
    
    receive() {
        // Use data
        if (self.data != null) {
            let flag = self.data!!.flag;
        }
    }
}