// optional nested string
struct InnerString {
    msg: String?;
}

contract TestContract {
    val: InnerString;
    
    init() {
        self.val = InnerString{
            msg: null
        };
    }
}